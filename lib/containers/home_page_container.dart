import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocw_app/actions/actions.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/presentation/home_page.dart';
import 'package:redux/redux.dart';

class HomePageContainer extends StatelessWidget {
  static const String routeNamed = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return HomePage(
          _viewModel.user,
          _viewModel.onLoadingComplete,
          _viewModel.onExit,
          _viewModel.allPostCount,
          _viewModel.myPostCount,
          _viewModel.reportCount,
          _viewModel.logout,
        );
      },
    );
  }
}

class _ViewModel {
  final User user;
  final Function onLoadingComplete;
  final Function onExit;
  final String myPostCount;
  final String allPostCount;
  final String reportCount;
  final Function logout;

  _ViewModel({
    this.user,
    this.onLoadingComplete,
    this.onExit,
    this.reportCount,
    this.myPostCount,
    this.allPostCount,
    this.logout,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      logout: () {
        store.dispatch(Logout());
      },
      user: store.state.user.profile,
      allPostCount: store.state.all.length.toString(),
      myPostCount: store.state.my.length.toString(),
      reportCount: store.state.getAllRequest.length.toString(),
      onExit: () {
        store.dispatch(ExitSession());
      },
      onLoadingComplete: () {
        store.dispatch(LoadingAction(false));
      },
    );
  }
}
