import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/request/request_type.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/serializers/serializers.dart';
import 'package:ocw_app/serializers/types.dart';
import 'package:ocw_app/utils/globals.dart';

Future<String> insertRequest({
  @required String userName,
  @required String userId,
  String reason = '',
  String amount = '',
  String description = 'fake',
  @required RequestType request,
  UserType userType,
  String parentId,
  @required TransactionStatus status,
}) async {
  Map<String, String> body = {
    'user_id': userId,
    'mode': 'insert-request',
    'user_name': userName,
    'amount': amount,
    'status': status.toString(),
    'requested_for': request.toString(),
    'reason': reason,
    'parent_id': parentId,
    'description': description,
    'user_type': userType.toString()
  };
  http.Response response = await http.post('$url', body: body);
  return response.body;
}

Future<List<Request>> getAllRequest() async {
  Map<String, String> body = {
    'mode': 'get-request',
  };
  http.Response response = await http.post('$url', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    List<Request> data = (serializers.deserialize(jsonDecode(response.body),
            specifiedType: requestList) as BuiltList<Request>)
        .toList();

    return data;
  }
}

Future performActionRequest(
    {String id, TransactionStatus status, String reason}) async {
  Map<String, String> body = {
    'id': id,
    'mode': 'update-request',
    'status': status.toString(),
    'reason': reason,
  };
  http.Response response = await http.post('$url', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}
