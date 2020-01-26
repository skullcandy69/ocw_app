import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ocw_app/models/user/user_type.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  String get fullName {
    return '$firstName ${lastName != null ? lastName : ''}';
  }

  @nullable
  @BuiltValueField(wireName: "first_name")
  String get firstName;

  @nullable
  @BuiltValueField(wireName: "last_name")
  String get lastName;

  @nullable
  String get id;

  @nullable
  String get parentId;

  @nullable
  @BuiltValueField(wireName: "email_id")
  String get emailId;

  @nullable
  @BuiltValueField(wireName: "PIN")
  String get pin;

  @nullable
  String get address;

  @nullable
  @BuiltValueField(wireName: "image_url")
  String get imageUrl;

  @nullable
  String get street;

  @nullable
  String get state;

  @nullable
  String get password;

  @nullable
  bool get isClient {
    if (UserType.client == userType) {
      return true;
    } else {
      return false;
    }
  }

  @nullable
  String get amount;

  @nullable
  String get city;

  @nullable
  @BuiltValueField(wireName: "user_type")
  UserType get userType;

  @nullable
  @BuiltValueField(wireName: "mobile_no")
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: "total_post")
  String get totalPost;

  @nullable
  @BuiltValueField(wireName: "report_post")
  String get reportPost;

  List<String> get pins {
    List<String> a = [];
    if (pin.startsWith('[')) {
      a.addAll(pin.replaceAll('[', '').replaceAll(']', '').split(','));
    } else {
      a.add(pin);
    }
    return a;
  }

  User._();

  factory User([updates(UserBuilder b)]) = _$User;
}
