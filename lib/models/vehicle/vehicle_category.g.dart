// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const VehicleCategory _$car = const VehicleCategory._('car');
const VehicleCategory _$bike = const VehicleCategory._('bike');

VehicleCategory _$valueOf(String name) {
  switch (name) {
    case 'car':
      return _$car;
    case 'bike':
      return _$bike;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<VehicleCategory> _$values =
    new BuiltSet<VehicleCategory>(const <VehicleCategory>[
  _$car,
  _$bike,
]);

Serializer<VehicleCategory> _$vehicleCategorySerializer =
    new _$VehicleCategorySerializer();

class _$VehicleCategorySerializer
    implements PrimitiveSerializer<VehicleCategory> {
  @override
  final Iterable<Type> types = const <Type>[VehicleCategory];
  @override
  final String wireName = 'VehicleCategory';

  @override
  Object serialize(Serializers serializers, VehicleCategory object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  VehicleCategory deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      VehicleCategory.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
