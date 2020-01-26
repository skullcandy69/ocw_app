// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RequestType _$pending = const RequestType._('money');
const RequestType _$success = const RequestType._('upgrade');
const RequestType _$report = const RequestType._('report');
const RequestType _$pin = const RequestType._('pin');

RequestType _$valueOf(String name) {
  switch (name) {
    case 'money':
      return _$pending;
    case 'upgrade':
      return _$success;
    case 'report':
      return _$report;
    case 'pin':
      return _$pin;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<RequestType> _$values =
    new BuiltSet<RequestType>(const <RequestType>[
  _$pending,
  _$success,
  _$report,
  _$pin,
]);

Serializer<RequestType> _$requestTypeSerializer = new _$RequestTypeSerializer();

class _$RequestTypeSerializer implements PrimitiveSerializer<RequestType> {
  @override
  final Iterable<Type> types = const <Type>[RequestType];
  @override
  final String wireName = 'RequestType';

  @override
  Object serialize(Serializers serializers, RequestType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  RequestType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RequestType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
