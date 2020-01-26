// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wash_service.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const WashService _$combined = const WashService._('combined');
const WashService _$steamWash = const WashService._('steamWash');
const WashService _$vacuumWash = const WashService._('vacuumWash');
const WashService _$seatClean = const WashService._('seatClean');
const WashService _$rubbingPolishing = const WashService._('rubbingPolishing');
const WashService _$package = const WashService._('package');
const WashService _$automaticWaxing = const WashService._('automaticWaxing');

WashService _$valueOf(String name) {
  switch (name) {
    case 'combined':
      return _$combined;
    case 'steamWash':
      return _$steamWash;
    case 'vacuumWash':
      return _$vacuumWash;
    case 'seatClean':
      return _$seatClean;
    case 'rubbingPolishing':
      return _$rubbingPolishing;
    case 'package':
      return _$package;
    case 'automaticWaxing':
      return _$automaticWaxing;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<WashService> _$values =
    new BuiltSet<WashService>(const <WashService>[
  _$combined,
  _$steamWash,
  _$vacuumWash,
  _$seatClean,
  _$rubbingPolishing,
  _$package,
  _$automaticWaxing,
]);

Serializer<WashService> _$washServiceSerializer = new _$WashServiceSerializer();

class _$WashServiceSerializer implements PrimitiveSerializer<WashService> {
  @override
  final Iterable<Type> types = const <Type>[WashService];
  @override
  final String wireName = 'WashService';

  @override
  Object serialize(Serializers serializers, WashService object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  WashService deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WashService.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
