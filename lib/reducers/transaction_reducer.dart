import 'package:ocw_app/actions/transaction.dart';
import 'package:ocw_app/actions/user_action.dart';
import 'package:ocw_app/models/transaction/transaction.dart';
import 'package:ocw_app/models/transaction/transaction_state.dart';
import 'package:redux/redux.dart';

import 'package:built_collection/built_collection.dart';

Reducer<TransactionState> transactionReducer = combineReducers([
  TypedReducer<TransactionState, FetchTransaction>(fetchTransactionReducer),
  TypedReducer<TransactionState, AddTransaction>(addTransactionReducer),
  TypedReducer<TransactionState, Logout>(logoutTransactionReducer),
]);

TransactionState fetchTransactionReducer(
    TransactionState state, FetchTransaction action) {
  Map<String, Transaction> map = action.transactions.fold(
      {},
      (Map<String, Transaction> objectsMap, Transaction transaction) =>
          objectsMap..addAll({transaction.id: transaction}));
  return state.rebuild((b) =>
      b..transactions = BuiltMap<String, Transaction>.from(map).toBuilder());
}

TransactionState addTransactionReducer(
    TransactionState state, AddTransaction action) {
  return state.rebuild((b) {
    b..transactions.addAll({action.transaction.id: action.transaction});
  });
}

TransactionState logoutTransactionReducer(TransactionState state, Logout action) {
return TransactionState();
}
