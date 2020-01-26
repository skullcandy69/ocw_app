import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/presentation/splash/promt_signup_splash_page.dart';
import 'package:redux/redux.dart';

class SplashContainer extends StatelessWidget {
  static const String routeNamed = 'Splash';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return PromptSignUpPage(isLoggedIn: _viewModel.isLoggedIn);
      },
    );
  }
}

class _ViewModel {
  final bool isLoggedIn;

  _ViewModel({
    this.isLoggedIn,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(isLoggedIn: store.state.user.isLoggedIn);
  }
}
