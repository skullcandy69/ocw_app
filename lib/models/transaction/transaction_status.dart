import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transaction_status.g.dart';

class TransactionStatus extends EnumClass {
  static const TransactionStatus pending = _$pending;
  static const TransactionStatus success = _$success;
  static const TransactionStatus failure = _$failure;

  static Serializer<TransactionStatus> get serializer =>
      _$transactionStatusSerializer;

  const TransactionStatus._(String name) : super(name);

  static BuiltSet<TransactionStatus> get values => _$values;

  static TransactionStatus valueOf(String name) => _$valueOf(name);

  static String displayValueOf(TransactionStatus name) {
    switch (name) {
      case TransactionStatus.failure:
        return "Failure";
      case TransactionStatus.success:
        return "Success";
      default:
        return "Pending";
    }
  }
}
