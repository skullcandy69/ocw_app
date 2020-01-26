// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TransactionStatus _$pending = const TransactionStatus._('pending');
const TransactionStatus _$success = const TransactionStatus._('success');
const TransactionStatus _$failure = const TransactionStatus._('failure');

TransactionStatus _$valueOf(String name) {
  switch (name) {
    case 'pending':
      return _$pending;
    case 'success':
      return _$success;
    case 'failure':
      return _$failure;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TransactionStatus> _$values =
    new BuiltSet<TransactionStatus>(const <TransactionStatus>[
  _$pending,
  _$success,
  _$failure,
]);

Serializer<TransactionStatus> _$transactionStatusSerializer =
    new _$TransactionStatusSerializer();

class _$TransactionStatusSerializer
    implements PrimitiveSerializer<TransactionStatus> {
  @override
  final Iterable<Type> types = const <Type>[TransactionStatus];
  @override
  final String wireName = 'TransactionStatus';

  @override
  Object serialize(Serializers serializers, TransactionStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  TransactionStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TransactionStatus.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
