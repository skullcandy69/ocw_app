import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'vehicle_category.g.dart';

class VehicleCategory extends EnumClass {
  static const VehicleCategory car = _$car;
  static const VehicleCategory bike = _$bike;


  static Serializer<VehicleCategory> get serializer => _$vehicleCategorySerializer;

  const VehicleCategory._(String name) : super(name);

  static BuiltSet<VehicleCategory> get values => _$values;

  static VehicleCategory valueOf(String name) => _$valueOf(name);

  static String displayValueOf(VehicleCategory name) {
    switch (name) {
      case VehicleCategory.car:
        return "Car";
      case VehicleCategory.bike:
        return "Bike";
      default:
        return "";
    }
  }
}
