import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wash_service.g.dart';

class WashService extends EnumClass {
  static const WashService combined = _$combined;
  static const WashService steamWash = _$steamWash;
  static const WashService vacuumWash = _$vacuumWash;
  static const WashService seatClean = _$seatClean;
  static const WashService rubbingPolishing = _$rubbingPolishing;
  static const WashService package = _$package;
  static const WashService automaticWaxing = _$automaticWaxing;

  static Serializer<WashService> get serializer => _$washServiceSerializer;

  const WashService._(String name) : super(name);

  static BuiltSet<WashService> get values => _$values;

  static WashService valueOf(String name) => _$valueOf(name);

  static String displayValueOf(WashService name) {
    switch (name) {
      case WashService.package:
        return "Package";
      case WashService.combined:
        return "Combined";
      case WashService.rubbingPolishing:
        return "Rubbing and Polishing";
      case WashService.seatClean:
        return "Seat Clean";
      case WashService.steamWash:
        return "Steam Wash";
      case WashService.automaticWaxing:
        return "Automatic Waxing";
      case WashService.vacuumWash:
        return "Vacuum Wash";
      default:
        return "";
    }
  }
}
