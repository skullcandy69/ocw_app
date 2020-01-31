import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocw_app/actions/user_action.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/models/vehicle/vehicle_type.dart';
import 'package:ocw_app/presentation/home/home.dart';
import 'package:redux/redux.dart';

class HomeContainer extends StatelessWidget {
  static const String routeNamed = 'Home Container';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return Home(
            _viewModel.priceTag,
            _viewModel.onRefresh,
            _viewModel.allPostCount,
            _viewModel.myPostCount,
            _viewModel.reportCount);
      },
    );
  }
}

class _ViewModel {
  final Map<VehicleType, PriceTag> priceTag;
  final Function onRefresh;
  final String myPostCount;
  final String allPostCount;
  final String reportCount;

  _ViewModel({
    this.priceTag,
    this.onRefresh,
    this.reportCount,
    this.myPostCount,
    this.allPostCount,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        priceTag: store.state.priceTag.priceTags.toMap(),
        allPostCount: store.state.all.length.toString(),
        myPostCount: store.state.my.length.toString(),
        reportCount: store.state.getAllRequest.length.toString(),
        onRefresh: () {
          store.dispatch(OnRefreshWallet());
        });
  }
}
