// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_sub_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const VehicleSubCategory _$small = const VehicleSubCategory._('small');
const VehicleSubCategory _$large = const VehicleSubCategory._('large');
const VehicleSubCategory _$medium = const VehicleSubCategory._('medium');

VehicleSubCategory _$valueOf(String name) {
  switch (name) {
    case 'small':
      return _$small;
    case 'large':
      return _$large;
    case 'medium':
      return _$medium;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<VehicleSubCategory> _$values =
    new BuiltSet<VehicleSubCategory>(const <VehicleSubCategory>[
  _$small,
  _$large,
  _$medium,
]);

Serializer<VehicleSubCategory> _$vehicleSubCategorySerializer =
    new _$VehicleSubCategorySerializer();

class _$VehicleSubCategorySerializer
    implements PrimitiveSerializer<VehicleSubCategory> {
  @override
  final Iterable<Type> types = const <Type>[VehicleSubCategory];
  @override
  final String wireName = 'VehicleSubCategory';

  @override
  Object serialize(Serializers serializers, VehicleSubCategory object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  VehicleSubCategory deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      VehicleSubCategory.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
