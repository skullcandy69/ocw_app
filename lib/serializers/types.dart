import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/transaction/transaction.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/models/vehicle/wash_service.dart';

const userList = FullType(BuiltList, [FullType(User)]);
const postList = FullType(BuiltList, [FullType(Post)]);
const washServiceList = FullType(BuiltList, [FullType(WashService)]);
const transactionList = FullType(BuiltList, [FullType(Transaction)]);
const priceTagList = FullType(BuiltList, [FullType(PriceTag)]);
const requestList = FullType(BuiltList, [FullType(Request)]);
