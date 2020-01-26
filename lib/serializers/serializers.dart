import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/request/request_type.dart';
import 'package:ocw_app/models/transaction/transaction.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/models/vehicle/vehicle_category.dart';
import 'package:ocw_app/models/vehicle/vehicle_sub_category.dart';
import 'package:ocw_app/models/vehicle/vehicle_type.dart';
import 'package:ocw_app/models/vehicle/wash_service.dart';
import 'package:ocw_app/serializers/types.dart';

part 'serializers.g.dart';

@SerializersFor([
  User,
  Post,
  PriceTag,
  Transaction,
  TransactionStatus,
  VehicleCategory,
  VehicleType,
  UserType,
  Request,
  RequestType,
  VehicleSubCategory,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(userList, () => ListBuilder<User>())
      ..addBuilderFactory(postList, () => ListBuilder<Post>())
      ..addBuilderFactory(washServiceList, () => ListBuilder<WashService>())
      ..addBuilderFactory(transactionList, () => ListBuilder<Transaction>())
      ..addBuilderFactory(requestList, () => ListBuilder<Request>())
      ..addBuilderFactory(priceTagList, () => ListBuilder<PriceTag>())
      ..addPlugin(new StandardJsonPlugin()))
    .build();
