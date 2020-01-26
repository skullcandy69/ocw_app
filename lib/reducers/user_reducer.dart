import 'package:ocw_app/actions/post_action.dart';
import 'package:ocw_app/actions/user_action.dart';
import 'package:ocw_app/actions/wallet.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:redux/redux.dart';

Reducer<UserState> userReducer = combineReducers([
  TypedReducer<UserState, SetUser>(setUserReducer),
  TypedReducer<UserState, SetUserComplete>(setUserCompleteReducer),
  TypedReducer<UserState, ViewPost>(viewPostReducer),
  TypedReducer<UserState, AddMoneyComplete>(addMoneyReducer),
  TypedReducer<UserState, Logout>(logoutReducer),
  TypedReducer<UserState, UpdateUser>(updateUserReducer),
  TypedReducer<UserState, CreatePostComplete>(totalPostReducer),
]);

UserState setUserReducer(UserState userState, SetUser action) {
  UserState newState = userState.rebuild((b) => b
    ..isLoggingIn = true
    ..isLoggedIn = false);
  return newState;
}

UserState setUserCompleteReducer(UserState state, SetUserComplete action) {
  return state.rebuild((b) {
    b..profile = action.user.toBuilder();
    b..isLoggingIn = false;
    b..isLoggedIn = true;
  });
}

UserState viewPostReducer(UserState state, ViewPost action) {
  print('print post ${action.post}');
  int amount =
      int.parse(state.profile.amount) - int.parse(action.post.viewAmount);
  return state.rebuild((b) {
    b..profile.amount = amount.toString();
  });
}

UserState addMoneyReducer(UserState state, AddMoneyComplete action) {
  int amount = int.parse(state.profile.amount) - int.parse(action.amount);
  return state.rebuild((b) {
    b..profile.amount = amount.toString();
  });
}

UserState logoutReducer(UserState state, Logout action) {
  return state.rebuild((b) {
    b..profile = null;
    b..isLoggedIn = false;
  });
}

UserState updateUserReducer(UserState state, UpdateUser action) {
  return state.rebuild((b) => b..profile = action.user.toBuilder());
}

UserState totalPostReducer(UserState state, CreatePostComplete action) {
  User user = state.profile.rebuild((b) {
    b..totalPost = (int.parse(b.totalPost) + 1).toString();
  });
  return state.rebuild((b) {
    b..profile = user.toBuilder();
  });
}
