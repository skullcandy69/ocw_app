import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ocw_app/models/request/request_type.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/models/user/user_type.dart';

part 'request.g.dart';

abstract class Request implements Built<Request, RequestBuilder> {
  Request._();

  @nullable
  String get id;

  @nullable
  @BuiltValueField(wireName: "user_id")
  String get userId;

  @nullable
  @BuiltValueField(wireName: "parent_id")
  String get parentId;

  @nullable
  @BuiltValueField(wireName: "post_id")
  String get postId;

  @nullable
  @BuiltValueField(wireName: "user_name")
  String get userName;

  @nullable
  String get amount;

  @nullable
  @BuiltValueField(wireName: "user_type")
  UserType get userType;

  @nullable
  TransactionStatus get status;

  @nullable
  String get reason;

  @nullable
  String get description;

  @nullable
  String get timestamp;

  @nullable
  @BuiltValueField(wireName: "requested_for")
  RequestType get request;

  factory Request([updates(RequestBuilder b)]) = _$Request;

  static Serializer<Request> get serializer => _$requestSerializer;
}
