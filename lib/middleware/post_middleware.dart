import 'package:ocw_app/actions/post_action.dart';
import 'package:ocw_app/actions/request_action.dart';
import 'package:ocw_app/actions/transaction.dart';
import 'package:ocw_app/actions/wallet.dart';
import 'package:ocw_app/database/notification/notification_database.dart';
import 'package:ocw_app/database/post/post_database.dart';
import 'package:ocw_app/database/transaction/transaction_database.dart';
import 'package:ocw_app/database/user/user_database.dart';
import 'package:ocw_app/database/wallet/wallet_database.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/broadcaster_event.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/request/request_type.dart';
import 'package:ocw_app/models/transaction/transaction.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:redux/redux.dart';

Future<Null> postMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  print("*******action called  " + action.runtimeType.toString() + "  *****");
  switch (action.runtimeType) {
    case CreatePost:
      next(action);
      print(store.state.user.profile.reportPost);
      insertPost(
              date: action.post.date.toString(),
              vehicleNumber: action.post.vehicleNo,
              vehicleDetails: action.post.makeAndModel,
              userId: action.post.userId,
              phoneNo: action.post.mobileNo,
              viewAmount: action.post.viewAmount,
              address: action.post.location,
              pin: action.post.pin,
              rate: (int.parse(store.state.user.profile.reportPost) >
                      int.parse(store.state.user.profile.totalPost))
                  ? '0'
                  : (int.parse(store.state.user.profile.reportPost) /
                          int.parse(store.state.user.profile.totalPost))
                      .toString(),
              vehicleType: action.post.vehicleType.toString(),
              vehicleCategory: action.post.vehicleCategory.toString(),
              name: action.post.name,
              userType: action.userType)
          .then((String value) {
        reportPost(total: 1, report: 0, id: store.state.user.profile.id);
        Post post = action.post;
        post = post.rebuild((b) => b
          ..id = value
          ..rate = (int.parse(store.state.user.profile.reportPost) /
                  int.parse(store.state.user.profile.totalPost))
              .toString());
        createPostNotification(post: action.post);
        store.dispatch(CreatePostComplete(post));
      }).catchError((e) {
        broadcasterService.broadcast(BroadcasterEvent(
            event: BroadcasterEventType.onError,
            data: {'Error': e.toString()}));
      });
      break;

    case DeletePost:
      deletePost(action.post.id).then((v) {
        broadcasterService.broadcast(
            BroadcasterEvent(event: BroadcasterEventType.onDeletingPost));
        next(action);
      }).catchError((e) {
        broadcasterService.broadcast(BroadcasterEvent(
            event: BroadcasterEventType.onError,
            data: {'Error': e.toString()}));
      });
      break;

    case ViewPost:
      preferenceService.setViewedPost(action.post.id);
      deductMoney(id: action.post.userId, amount: action.post.viewAmount)
          .then((v) async {
        createTransaction(
                amount: action.post.viewAmount,
                receiverId: action.post.userId,
                senderId: store.state.user.profile.id,
                name: store.state.user.profile.fullName,
                status: TransactionStatus.pending)
            .then((value) {
          print('created $value');
          Transaction transaction = Transaction();

          store.dispatch(AddTransaction(transaction.rebuild((b) {
            b..amount = action.post.viewAmount;
            b..userId = action.post.userId;
            b..id = value;
            b..name = store.state.user.profile.fullName;
            b..senderId = store.state.user.profile.id;
            b..timestamp = DateTime.now().toString();
            b..status = TransactionStatus.success;
          })));
          broadcasterService.broadcast(
              BroadcasterEvent(event: BroadcasterEventType.onViewingPost));
        }).catchError((e) {
          broadcasterService.broadcast(BroadcasterEvent(
              event: BroadcasterEventType.onError,
              data: {'Error': e.toString()}));
        });
      });
      next(action);
      break;

    case AddMoney:
      deductMoney(amount: action.amount, id: store.state.user.profile.id)
          .then((v) {
        broadcasterService.broadcast(
            BroadcasterEvent(event: BroadcasterEventType.onSendingMoney));
        store.dispatch(AddMoneyComplete(action.amount, action.id));
      }).catchError((e) {
        broadcasterService.broadcast(BroadcasterEvent(
            event: BroadcasterEventType.onError,
            data: {'Error': e.toString()}));
      });
      break;

    case AddMoneyComplete:
      sendMoney(amount: action.amount, id: action.id).then((value) {
        createTransaction(
                senderId: store.state.user.profile.id,
                receiverId: action.id,
                status: TransactionStatus.success,
                name: store.state.user.profile.fullName,
                amount: action.amount)
            .then((id) {
          Transaction transaction = Transaction();
          store.dispatch(AddTransaction(transaction.rebuild((b) {
            b..amount = action.amount;
            b..userId = action.id;
            b..id = id;
            b..name = store.state.user.profile.fullName;
            b..senderId = store.state.user.profile.id;
            b..timestamp = DateTime.now().toString();
            b..status = TransactionStatus.success;
          })));
        }).catchError((e) {
          broadcasterService.broadcast(BroadcasterEvent(
              event: BroadcasterEventType.onError,
              data: {'Error': e.toString()}));
        });
        specificNotification(amount: action.amount, id: action.id);
        next(action);
      });
      break;

    case EditPost:
      broadcasterService.broadcast(
          BroadcasterEvent(event: BroadcasterEventType.onEditingPost));
      next(action);
      break;

    case FetchMore:
      next(action);
      getAllPost(store.state.user.profile.pin).then((posts) {
        store.dispatch(FetchPosts(posts));
        store.dispatch(FetchMoreComplete());
      }).catchError((e) {
        broadcasterService.broadcast(BroadcasterEvent(
            event: BroadcasterEventType.onError,
            data: {'Error': e.toString()}));
      });
      break;
    case AcceptPost:
      acceptPost(action.post.id, store.state.user.profile.id).then((v) {
        if (v == 'success') {
          next(action);
        }
        broadcasterService.broadcast(
            BroadcasterEvent(event: BroadcasterEventType.onAccepting));
      }).catchError((e) {
        broadcasterService.broadcast(BroadcasterEvent(
            event: BroadcasterEventType.onError,
            data: {'Error': e.toString()}));
      });
      break;
    case ReportPost:
      Request request = Request().rebuild((b) {
        b..request = RequestType.report;
        b..amount = action.post.viewAmount;
        b..status = TransactionStatus.pending;
        b..userId = store.state.user.profile.id;
        b..userName = store.state.user.profile.fullName;
        b..timestamp = DateTime.now().toString();
        b..parentId = '0';
      });

      reportPost(id: action.post.userId, report: 1, total: 0).then((b) {
        if (b == 'success') {
          broadcasterService.broadcast(
              BroadcasterEvent(event: BroadcasterEventType.onReportingPost));
        }
      }).catchError((e) {
        broadcasterService.broadcast(BroadcasterEvent(
            event: BroadcasterEventType.onError,
            data: {'Error': e.toString()}));
      });
      store.dispatch(CreateRequest(request: request));
      break;
    default:
      next(action);
  }
}
