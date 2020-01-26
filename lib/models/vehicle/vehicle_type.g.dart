// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const VehicleType _$huchback = const VehicleType._('huchback');
const VehicleType _$sedan = const VehicleType._('sedan');
const VehicleType _$suv = const VehicleType._('suv');
const VehicleType _$luxury = const VehicleType._('luxury');
const VehicleType _$sofa = const VehicleType._('sofa');

VehicleType _$valueOf(String name) {
  switch (name) {
    case 'huchback':
      return _$huchback;
    case 'sedan':
      return _$sedan;
    case 'suv':
      return _$suv;
    case 'luxury':
      return _$luxury;
    case 'sofa':
      return _$sofa;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<VehicleType> _$values =
    new BuiltSet<VehicleType>(const <VehicleType>[
  _$huchback,
  _$sedan,
  _$suv,
  _$luxury,
  _$sofa,
]);

Serializer<VehicleType> _$vehicleTypeSerializer = new _$VehicleTypeSerializer();

class _$VehicleTypeSerializer implements PrimitiveSerializer<VehicleType> {
  @override
  final Iterable<Type> types = const <Type>[VehicleType];
  @override
  final String wireName = 'VehicleType';

  @override
  Object serialize(Serializers serializers, VehicleType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  VehicleType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      VehicleType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
