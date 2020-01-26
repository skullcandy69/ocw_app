import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'request_type.g.dart';

class RequestType extends EnumClass {
  static const RequestType money = _$pending;
  static const RequestType upgrade = _$success;
  static const RequestType report = _$report;
  static const RequestType pin = _$pin;

  static Serializer<RequestType> get serializer => _$requestTypeSerializer;

  const RequestType._(String name) : super(name);

  static BuiltSet<RequestType> get values => _$values;

  static RequestType valueOf(String name) => _$valueOf(name);

  static String displayValueOf(RequestType name) {
    switch (name) {
      case RequestType.upgrade:
        return "Request For Upgrade";
      case RequestType.pin:
        return "Request For Pin";
      case RequestType.report:
        return "Report";
      default:
        return "Request For Money";
    }
  }
}
