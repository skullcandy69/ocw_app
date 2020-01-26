import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocw_app/actions/user_action.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/presentation/splash/login_page.dart';
import 'package:redux/redux.dart';

class LoginContainer extends StatelessWidget {
  static const String routeNamed = 'Login container';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return LoginPage(
          onLogin: _viewModel.onLogging,
          isLoggingIn: _viewModel.isLoggingIn,
          isLoggedIn: _viewModel.isLoggedIn,
        );
      },
    );
  }
}

class _ViewModel {
  final User user;
  final Function onLogging;
  final bool isLoggingIn;
  final bool isLoggedIn;

  _ViewModel({
    this.user,
    this.isLoggingIn,
    this.onLogging,
    this.isLoggedIn,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      user: store.state.user.profile,
      isLoggedIn: store.state.user.isLoggedIn,
      isLoggingIn: store.state.user.isLoggingIn,
      onLogging: (String id, String password) {
        print('id is $id , password is $password');
        store.dispatch(Logging(id, password));
      },
    );
  }
}
