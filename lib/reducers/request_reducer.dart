import 'package:ocw_app/actions/request_action.dart';
import 'package:ocw_app/actions/user_action.dart';
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/request/request_state.dart';
import 'package:redux/redux.dart';

import 'package:built_collection/built_collection.dart';

Reducer<RequestState> requestReducer = combineReducers([
  TypedReducer<RequestState, FetchRequestComplete>(fetchRequestCompleteReducer),
  TypedReducer<RequestState, FetchRequest>(fetchRequestReducer),
  TypedReducer<RequestState, CreateRequestComplete>(addRequestReducer),
  TypedReducer<RequestState, PerformAction>(performActionRequestReducer),
  TypedReducer<RequestState, Logout>(logoutRequestReducer),
]);

RequestState fetchRequestCompleteReducer(
    RequestState state, FetchRequestComplete action) {
  Map<String, Request> map = action.requests.fold(
      {},
      (Map<String, Request> objectsMap, Request transaction) =>
          objectsMap..addAll({transaction.id: transaction}));
  return state.rebuild((b) => b
    ..requests = BuiltMap<String, Request>.from(map).toBuilder()
    ..isLoading = false);
}

RequestState addRequestReducer(RequestState state, CreateRequestComplete action) {
  return state.rebuild((b) {
    b..requests.addAll({action.request.id: action.request});
  });
}

RequestState fetchRequestReducer(RequestState state, FetchRequest action) {
  return state.rebuild((b) => b..isLoading = true);
}

RequestState performActionRequestReducer(
    RequestState state, PerformAction action) {
  return state.rebuild((b) {
    b..requests.addAll({action.request.id: action.request});
  });
}

RequestState logoutRequestReducer(RequestState state, Logout action) {
return RequestState();
}
