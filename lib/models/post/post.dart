import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/models/vehicle/vehicle_category.dart';
import 'package:ocw_app/models/vehicle/vehicle_type.dart';

part 'post.g.dart';

abstract class Post implements Built<Post, PostBuilder> {
  Post._();

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: "user_id")
  String get userId;

  @nullable
  @BuiltValueField(wireName: "user_type")
  UserType get userType;

  @nullable
  @BuiltValueField(wireName: "mobile_no")
  String get mobileNo;

  @nullable
  @BuiltValueField(wireName: "PIN")
  String get pin;

  @nullable
  @BuiltValueField(wireName: "address")
  String get location;

  @nullable
  @BuiltValueField(wireName: "view_amount")
  String get viewAmount;

  @nullable
  String get rate;

  @nullable
  @BuiltValueField(wireName: "vehicle_cat")
  VehicleCategory get vehicleCategory;

  @nullable
  @BuiltValueField(wireName: "vehicle_type")
  VehicleType get vehicleType;

  @nullable
  @BuiltValueField(wireName: "make_model")
  String get makeAndModel;

  @nullable
  @BuiltValueField(wireName: "vehicle_number")
  String get vehicleNo;

  @nullable
  @BuiltValueField(wireName: "preffere_date")
  String get date;

  @nullable
  @BuiltValueField(wireName: "timestamp")
  String get createdAt;

  @nullable
  @BuiltValueField(wireName: "status")
  String get status;

  bool get isAccepted {
    if (status == '0') {
      return false;
    } else
      return true;
  }

  @nullable
  @BuiltValueField(wireName: "accepted_by")
  String get acceptedBy;

  @nullable
  User get user;

  factory Post([updates(PostBuilder b)]) = _$Post;

  static Serializer<Post> get serializer => _$postSerializer;
}
