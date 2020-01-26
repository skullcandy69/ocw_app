import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocw_app/actions/request_action.dart';
import 'package:ocw_app/actions/user_action.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/presentation/post/all_requests.dart';
import 'package:redux/redux.dart';

class RequestContainer extends StatelessWidget {
  static const String routeNamed = 'Request';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return AllRequests(
            _viewModel.request, _viewModel.onRefresh, _viewModel.performAction);
      },
    );
  }
}

class _ViewModel {
  final List<Request> request;
  final Function performAction;
  final Function onRefresh;

  _ViewModel({this.request, this.performAction, this.onRefresh});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        onRefresh: () {
          store.dispatch(OnRefreshWallet());
        },
        request: store.state.getAllRequest,
        performAction: (Request request) {
          store.dispatch(PerformAction(request));
        });
  }
}
