import 'package:ocw_app/actions/actions.dart';
import 'package:ocw_app/actions/post_action.dart';
import 'package:ocw_app/actions/request_action.dart';
import 'package:ocw_app/actions/transaction.dart';
import 'package:ocw_app/actions/wallet.dart';
import 'package:ocw_app/database/post/post_database.dart';
import 'package:ocw_app/database/request_database/request_database.dart';
import 'package:ocw_app/database/transaction/transaction_database.dart';
import 'package:ocw_app/database/user/user_database.dart';
import 'package:ocw_app/database/wallet/wallet_database.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/broadcaster_event.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/service/notification_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:redux/redux.dart';

Future<Null> appMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  print("*******action called  " + action.runtimeType.toString() + "  *****");
  print("In app middleware");

  store.state.transaction.transactions.values.forEach((b) {
    if (b.status == TransactionStatus.pending &&
        DateTime.now().difference(DateTime.parse(b.timestamp)) >
            Duration(hours: 6)) {
      updateTransaction(status: TransactionStatus.success, id: b.id).then((v) {
        if (v == 'success') {
          store.dispatch(AddMoneyComplete(b.amount, b.userId));
          store.dispatch(AddTransaction(
              b.rebuild((value) => value..status = TransactionStatus.success)));
        }
      });
    }
  });

  switch (action.runtimeType) {
    case LoadingAction:
      print("In loading action");
      next(action);
      break;
    case CheckSession:
      preferenceService.getAuthUser().then((User user) {
        if (user != null && user.id != null) {
          if (!(user.userType == UserType.client)) {
            initOneSignal();
            addOneSignalUser(user);
          }
          getAllTransaction(user.id).then((value) {
            store.dispatch(FetchTransaction(value));
          });
          store.dispatch(SetUserComplete(user: user));
          getPriceService().then((List<PriceTag> value) {
            store.dispatch(SetPriceTag(value));
          });
//          getAllRequest().then((List<Request> requestList) {
//            store.dispatch(FetchRequest(requestList));
//          });
//          user.pins.forEach((g) {
//            getAllPost(g).then((List<Post> posts) {
//              print('posts are $posts');
//              store.dispatch(FetchPosts(posts));
//            });
//          });

          preferenceService.getViewedPostList().then((v) {
            store.dispatch(GetViewedPost(v));
          });
        }
      });
      break;
    case ExitSession:
      preferenceService.setAuthUser(store.state.user.profile).then((v) {
        broadcasterService.broadcast(
            BroadcasterEvent(event: BroadcasterEventType.onExitSession));
      });
      break;

    case OnRefreshWallet:
      next(action);
      store.dispatch(CheckSession());
      login(
              password: store.state.user.profile.password,
              emailId: store.state.user.profile.emailId)
          .then((value) {
        store.dispatch(OnRefreshWalletComplete());
        store.dispatch(SetUser(user: value));
      });
      break;

    default:
      next(action);
  }
}
