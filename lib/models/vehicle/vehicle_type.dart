import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'vehicle_type.g.dart';

class VehicleType extends EnumClass {
  static const VehicleType huchback = _$huchback;
  static const VehicleType sedan = _$sedan;
  static const VehicleType suv = _$suv;
  static const VehicleType luxury = _$luxury;
  static const VehicleType sofa = _$sofa;

  static Serializer<VehicleType> get serializer => _$vehicleTypeSerializer;

  const VehicleType._(String name) : super(name);

  static BuiltSet<VehicleType> get values => _$values;

  static VehicleType valueOf(String name) => _$valueOf(name);

  static String displayValueOf(VehicleType name) {
    switch (name) {
      case VehicleType.huchback:
        return "Huchback";
      case VehicleType.luxury:
        return "Luxury";
      case VehicleType.sedan:
        return "Sedan";
      case VehicleType.suv:
        return "Suv";
      default:
        return "Sofa";
    }
  }
}
