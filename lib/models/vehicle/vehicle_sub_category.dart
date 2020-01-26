import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'vehicle_sub_category.g.dart';

class VehicleSubCategory extends EnumClass {
  static const VehicleSubCategory small = _$small;
  static const VehicleSubCategory large = _$large;
  static const VehicleSubCategory medium = _$medium;

  static Serializer<VehicleSubCategory> get serializer => _$vehicleSubCategorySerializer;

  const VehicleSubCategory._(String name) : super(name);

  static BuiltSet<VehicleSubCategory> get values => _$values;

  static VehicleSubCategory valueOf(String name) => _$valueOf(name);

  static String displayValueOf(VehicleSubCategory name) {
    switch (name) {
      case VehicleSubCategory.large:
        return "Large";
      case VehicleSubCategory.medium:
        return "Medium";
      default:
        return "Small";
    }
  }
}
