import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:ocw_app/models/transaction/transaction.dart';

part 'transaction_state.g.dart';

abstract class TransactionState implements Built<TransactionState, TransactionStateBuilder> {
  @nullable
  BuiltMap<String,Transaction> get transactions;

  @nullable
  bool get isLoading;


  TransactionState._();

  factory TransactionState() {
    return _$TransactionState((b) {
    b..transactions = BuiltMap<String,Transaction>().toBuilder();
    });
  }
}
