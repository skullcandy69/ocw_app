import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/serializers/serializers.dart';
import 'package:ocw_app/serializers/types.dart';
import 'package:ocw_app/utils/globals.dart';

Future deletePost(String id) async {
  Map<String, String> body = {'id': id,'mode':'remove-post'};
  http.Response response = await http.post('$url', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}

Future acceptPost(String id, String userId) async {
  Map<String, String> body = {'id': id, 'user_id': userId,'mode':'accept-post'};
  http.Response response = await http.post('$url/accept-post.php', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}

Future<String> insertPost(
    {@required String phoneNo,
    @required String address,
    @required String pin,
    @required String vehicleDetails,
    @required String vehicleType,
    @required String vehicleCategory,
    @required String viewAmount,
    @required String date,
    @required String userId,
    @required vehicleNumber,
    @required String name,
    @required String rate,
    @required UserType userType}) async {
  Map<String, dynamic> body = {
  'mode':'insert-post',
    'mobile_no': phoneNo,
    'PIN': pin,
    'vehicle_cat': vehicleCategory,
    'vehicle_type': vehicleType,
    'address': address,
    'view_amount': viewAmount,
    'name': name,
    'preffere_date': date,
    'vehicle_number': vehicleNumber,
    'user_id': userId,
    'rate': rate,
    'user_type': userType.toString(),
  };
  body.removeWhere((String key, dynamic value) =>
      value == null || value == 'null' || value.isEmpty);
  http.Response response = await http.post('$url', body: body);
  print("response is ${response.body}");
  return response.body;
}

Future<List<Post>> getAllPost(String pin) async {
  Map<String, String> body = {'pin': pin, 'mode': 'get'};
  http.Response response = await http.post('$url', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    print('price in database is ${response.body}');
    List<Post> data = (serializers.deserialize(jsonDecode(response.body),
            specifiedType: postList) as BuiltList<Post>)
        .toList();

    return data;
  }
}

//`mobile_no`, `address`, `PIN`, `vehicle_cat`, `vehicle_type` `make_model`, `vehicle_number`
