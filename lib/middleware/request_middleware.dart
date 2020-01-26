import 'package:ocw_app/actions/actions.dart';
import 'package:ocw_app/actions/request_action.dart';
import 'package:ocw_app/actions/wallet.dart';
import 'package:ocw_app/database/request_database/request_database.dart';
import 'package:ocw_app/database/user/user_database.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/broadcaster_event.dart';
import 'package:ocw_app/models/request/request_type.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:redux/redux.dart';

Future<Null> requestMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  print("*******action called  " + action.runtimeType.toString() + "  *****");
  switch (action.runtimeType) {
    case FetchRequest:
      next(action);
      store.dispatch(FetchRequestComplete(action.requests));
      break;

    case CreateRequest:
      insertRequest(
              userName: action.request.userName,
              userId: action.request.userId,
              request: action.request.request,
              parentId: action.request.parentId,
              userType: action.request.userType != null
                  ? action.request.userType
                  : store.state.user.profile.userType,
              status: action.request.status)
          .then((value) {
        if (action.request.request == RequestType.money) {
          broadcasterService.broadcast(
              BroadcasterEvent(event: BroadcasterEventType.onRequestingMoney));
        } else {
          broadcasterService.broadcast(
              BroadcasterEvent(event: BroadcasterEventType.onUpdateUserType));
        }

        store.dispatch(CreateRequestComplete(
            action.request.rebuild((b) => b..id = value)));
      }).catchError((e) {
        broadcasterService.broadcast(BroadcasterEvent(
            event: BroadcasterEventType.onError,
            data: {'Error': e.toString()}));
      });
      break;

    case CreateRequestComplete:
      next(action);

      break;
    case PerformAction:
      performActionRequest(
              status: action.request.status,
              id: action.request.id,
              reason:
                  action.request.reason == null ? ' ' : action.request.reason)
          .then((v) {
        if (v == 'success') {
          next(action);
          if (action.request.request == RequestType.upgrade) {
            updateUserType(
                    status: action.request.userType,
                    id: action.request.userId,
                    parentId: action.request.parentId == '0'
                        ? store.state.user.profile.id
                        : action.request.parentId)
                .then((v) {
              if (v == 'success') {
                store.dispatch(OnRefreshWallet());
              }
            });
          } else if (action.request.request == RequestType.report) {
            reportPost(id: action.request.userId, report: 1, total: 0);
          } else if (action.request.request == RequestType.pin) {
            print(action.request.parentId);
            updatePin(
                id: action.request.userId, parentId: action.request.parentId);
          } else {
            store.dispatch(
                AddMoney(action.request.amount, action.request.userId));
          }
          if (action.request.status == TransactionStatus.failure) {
            broadcasterService.broadcast(BroadcasterEvent(
              event: BroadcasterEventType.onRejecting,
            ));
          }
        }
      }).catchError((e) {
        broadcasterService.broadcast(BroadcasterEvent(
            event: BroadcasterEventType.onError,
            data: {'Error': e.toString()}));
      });
      break;
    default:
      next(action);
  }
}
