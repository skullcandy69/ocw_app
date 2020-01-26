import 'package:ocw_app/actions/actions.dart';
import 'package:ocw_app/actions/user_action.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/models/vehicle/vehicle_type.dart';
import 'package:ocw_app/reducers/post_reducer.dart';
import 'package:ocw_app/reducers/request_reducer.dart';
import 'package:ocw_app/reducers/transaction_reducer.dart';
import 'package:ocw_app/reducers/user_reducer.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  return state.rebuild((b) => b
    ..isLoading = loadingReducer(state.isLoading, action)
    ..isRefreshing = refreshingReducer(state.isRefreshing, action)
    ..user.replace(userReducer(state.user, action))
    ..post.replace(postReducer(state.post, action))
    ..priceTag.replace(priceTagReducer(state.priceTag, action))
    ..transaction.replace(transactionReducer(state.transaction, action))
    ..request.replace(requestReducer(state.request, action)));
}

Reducer<bool> loadingReducer =
    combineReducers<bool>([TypedReducer<bool, LoadingAction>(setLoading)]);

Reducer<bool> refreshingReducer = combineReducers<bool>([
  TypedReducer<bool, OnRefreshWallet>(onRefresh),
  TypedReducer<bool, OnRefreshWalletComplete>(onRefreshComplete)
]);

Reducer<PriceTagState> priceTagReducer = combineReducers<PriceTagState>(
    [TypedReducer<PriceTagState, SetPriceTag>(setPriceTag)]);

bool setLoading(bool state, LoadingAction action) {
  return action.isLoading;
}

PriceTagState setPriceTag(PriceTagState state, SetPriceTag action) {
  Map<VehicleType, PriceTag> map = {};
  if (action.priceTag != null) {
    map = action.priceTag.fold(
        {},
        (Map<VehicleType, PriceTag> objectsMap, PriceTag priceTag) =>
            objectsMap..addAll({priceTag.vehicleType: priceTag}));
  }
  return state.rebuild((b) => b..priceTags.addAll(map));
}

bool onRefresh(bool state, OnRefreshWallet action) {
  return true;
}

bool onRefreshComplete(bool state, OnRefreshWalletComplete action) {
  return false;
}
