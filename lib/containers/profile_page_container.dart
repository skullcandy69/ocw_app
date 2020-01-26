import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocw_app/actions/request_action.dart';
import 'package:ocw_app/actions/user_action.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/request/request_type.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/presentation/profile/profile_page.dart';
import 'package:redux/redux.dart';

class ProfileContainer extends StatelessWidget {
  static const String routeNamed = 'Profile Container';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return ProfilePage(
          user: _viewModel.user,
          createRequest: _viewModel.createRequest,
          updateUser: _viewModel.updateUser,
          logout: _viewModel.logout,
        );
      },
    );
  }
}

class _ViewModel {
  final User user;
  final Function updateUser;
  final Function createRequest;
  final Function logout;

  _ViewModel({this.user, this.updateUser, this.logout, this.createRequest});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        user: store.state.user.profile,
        logout: () {
          store.dispatch(Logout());
        },
        updateUser: (User user) {
          store.dispatch(UpdateUser(user));
        },
        createRequest: ({UserType userType, String parentId}) {
          print('reqq $parentId');
          Request request;
          if (userType == null) {
            request = Request().rebuild((b) {
              b..request = RequestType.pin;
              b..status = TransactionStatus.pending;
              b..userId = store.state.user.profile.id;
              b..userName = store.state.user.profile.fullName;
              b..timestamp = DateTime.now().toString();
              b..userType = userType;
              b..parentId = parentId != null ? parentId : '0';
            });
          } else {
            request = Request().rebuild((b) {
              b..request = RequestType.upgrade;
              b..status = TransactionStatus.pending;
              b..userId = store.state.user.profile.id;
              b..userName = store.state.user.profile.fullName;
              b..timestamp = DateTime.now().toString();
              b..userType = userType;
              b..parentId = parentId != null ? parentId : '0';
            });
          }

          store.dispatch(CreateRequest(request: request));
        });
  }
}
