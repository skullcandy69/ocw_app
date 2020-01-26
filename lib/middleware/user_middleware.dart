import 'package:ocw_app/actions/actions.dart';
import 'package:ocw_app/database/user/user_database.dart';
import 'package:ocw_app/database/wallet/wallet_database.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/broadcaster_event.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/service/notification_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:redux/redux.dart';

Future<Null> userMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  print("*******action called  " + action.runtimeType.toString() + "  *****");
  print("In user middleware");
  switch (action.runtimeType) {
    case SetUser:
      next(action);
      getPriceService().then((List<PriceTag> price) {
        store.dispatch(SetPriceTag(price));
      });
      if (action.user.id == null) {
        insertUser(
                firstName: action.user.firstName,
                lastName: action.user.lastName,
                userType: action.user.userType.toString(),
                address: action.user.address,
                pin: action.user.pin,
                mobileNo: action.user.phoneNumber,
                emailId: action.user.emailId,
                city: action.user.city,
                street: action.user.street,
                password: action.user.password)
            .then((String id) {
//              if(id.contains('Error')){
//
//              }else{
//
//              }
          User user = action.user;
          user = user.rebuild((b) => b..id = id);
          preferenceService.setAuthUser(user);
          if (!(user.userType == UserType.client)) {
            initOneSignal();
            addOneSignalUser(action.user);
          }
          store.dispatch(SetUserComplete(user: user));
        }).catchError((e) {
          broadcasterService.broadcast(BroadcasterEvent(
              event: BroadcasterEventType.onError,
              data: {'Error': e.toString(), 'type': 'signup'}));
        });
      } else {
        preferenceService.setAuthUser(action.user);
        if (!(action.user.userType == UserType.client)) {
          initOneSignal();
          addOneSignalUser(action.user);
        }
        store.dispatch(SetUserComplete(user: action.user));
      }
      break;

    case SetUserComplete:
      next(action);
      broadcasterService
          .broadcast(BroadcasterEvent(event: BroadcasterEventType.onSignUp));
      break;
    case Logout:
      next(action);
      await preferenceService.logout();
      broadcasterService
          .broadcast(BroadcasterEvent(event: BroadcasterEventType.onLogout));
      break;
    case Logging:
      print('id is ${action.id} , password is ${action.password}');
      login(emailId: action.id, password: action.password).then((v) {
        print('value $v');
        if (v != null) {
          getPriceService().then((List<PriceTag> price) {
            store.dispatch(SetPriceTag(price));
          });

          broadcasterService
              .broadcast(BroadcasterEvent(event: BroadcasterEventType.onLogin));

          store.dispatch(SetUser(user: v));
        } else {
          broadcasterService.broadcast(BroadcasterEvent(
              event: BroadcasterEventType.onError,
              data: {'Error': 'Invalid Credentials', 'type': 'login'}));
        }
      }).catchError((e) {
        broadcasterService.broadcast(BroadcasterEvent(
            event: BroadcasterEventType.onError,
            data: {'Error': e.toString()}));
      });
      break;

    case UpdateUser:
      updateUser(
              firstName: action.user.firstName,
              id: action.user.id,
              userType: action.user.userType.toString(),
              address: action.user.address,
              pin: action.user.pin,
              mobileNo: action.user.phoneNumber,
              emailId: action.user.emailId,
              city: action.user.city,
              street: action.user.street,
              password: action.user.password,
              lastName: action.user.lastName)
          .then((b) {
        print(b);
        if (b == 'success') {
          broadcasterService.broadcast(
              BroadcasterEvent(event: BroadcasterEventType.onUpdateUser));
          next(action);
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
