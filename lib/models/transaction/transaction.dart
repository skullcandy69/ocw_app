import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';

part 'transaction.g.dart';

abstract class Transaction implements Built<Transaction, TransactionBuilder> {
  Transaction._();

  @nullable
  String get id;

  @nullable
  @BuiltValueField(wireName: "receiver_id")
  String get userId;

  @nullable
  String get amount;

  @nullable
  String get timestamp;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: "sender_id")
  String get senderId;

  @nullable
  TransactionStatus get status;

  factory Transaction() {
    return _$Transaction((b) {});
  }

  static Serializer<Transaction> get serializer => _$transactionSerializer;
}
