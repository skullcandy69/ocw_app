import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_type.g.dart';

class UserType extends EnumClass {
  static const UserType client = _$client;
  static const UserType online = _$online;
  static const UserType franchise = _$franchise;
  static const UserType freelancer = _$freelancer;
  static const UserType admin = _$admin;

  static Serializer<UserType> get serializer => _$userTypeSerializer;

  const UserType._(String name) : super(name);

  static BuiltSet<UserType> get values => _$values;

  static UserType valueOf(String name) => _$valueOf(name);

  static String displayValueOf(UserType name) {
    switch (name) {
      case UserType.admin:
        return "Admin";
      case UserType.franchise:
        return "Franchise";
      case UserType.online:
        return "online";
      case UserType.freelancer:
        return "Freelancer";
      case UserType.client:
        return "Client";
      default:
        return "Client";
    }
  }
}
