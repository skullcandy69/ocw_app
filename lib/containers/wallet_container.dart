import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocw_app/actions/request_action.dart';
import 'package:ocw_app/actions/user_action.dart';
import 'package:ocw_app/actions/wallet.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/request/request_type.dart';
import 'package:ocw_app/models/transaction/transaction.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/presentation/wallet/wallet_page.dart';
import 'package:redux/redux.dart';

class WalletContainer extends StatelessWidget {
  static const String routeNamed = 'Wallet';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return Wallet(
          user: _viewModel.user,
          onSendMoney: _viewModel.onSendMoney,
          onRequestMoney: _viewModel.onRequestingMoney,
          isRefreshing: _viewModel.isRefreshing,
          onRefresh: _viewModel.onRefresh,
          transactions: _viewModel.transactions,
        );
      },
    );
  }
}

class _ViewModel {
  final User user;
  final Function onSendMoney;
  final Function onRequestingMoney;
  final Function onRefresh;
  final bool isRefreshing;
  final List<Transaction> transactions;

  _ViewModel(
      {this.user,
      this.onSendMoney,
      this.onRequestingMoney,
      this.onRefresh,
      this.isRefreshing,
      this.transactions});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        user: store.state.user.profile,
        onRequestingMoney: (String amount) {
          Request request = Request().rebuild((b) {
            b..request = RequestType.money;
            b..amount = amount;
            b..status = TransactionStatus.pending;
            b..userId = store.state.user.profile.id;
            b..userName = store.state.user.profile.fullName;
            b..timestamp = DateTime.now().toString();
            b..parentId = '0';
          });
          store.dispatch(CreateRequest(request: request));
        },
        onRefresh: () {
          store.dispatch(OnRefreshWallet());
        },
        transactions: store.state.getAllTransaction,
        isRefreshing: store.state.isRefreshing,
        onSendMoney: (String id, String amount) {
          store.dispatch(AddMoney(amount, id));
        });
  }
}
