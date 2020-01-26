import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:built_collection/built_collection.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/serializers/serializers.dart';
import 'package:ocw_app/serializers/types.dart';
import 'package:ocw_app/utils/globals.dart';

Future<List<User>> getAllUser() async {
  Map<String, String> body = {'mode': 'get'};
  http.Response response = await http.post('$url', body: body);

  List<User> data = (serializers.deserialize(jsonDecode(response.body),
          specifiedType: userList) as BuiltList<User>)
      .toList();
  return data;
}

Future<List<dynamic>> getAllUserId() async {
  Map<String, String> body = {
    'mode': 'get-user-id-except-client',
    'user_type': UserType.admin.toString()
  };
  http.Response response = await http.post('$url', body: body);

  return json.decode(response.body);
}

Future<List<dynamic>> getUserDetails() async {
  Map<String, String> body = {
    'mode': 'fetch-user-details',
  };
  http.Response response = await http.get('$url');

  return json.decode(response.body);
}

Future<List<User>> fetchUser(String userId) async {
  Map<String, String> body = {
    'mode': 'get_post',
  };
  http.Response response = await http.post('$url', body: body);

  List<User> data = (serializers.deserialize(jsonDecode(response.body),
          specifiedType: userList) as BuiltList<User>)
      .toList();
  return data;
}

Future<String> insertUser(
    {@required String firstName,
    String lastName,
    @required String userType,
    @required String address,
    @required String pin,
    @required String mobileNo,
    @required String emailId,
    @required String city,
    @required String street,
    @required String password}) async {
  Map<String, dynamic> body = {
    'mode': 'insert-user',
    'first_name': firstName,
    'last_name': lastName,
    'user_type': userType,
    'address': address,
    'PIN': pin,
    'mobile_no': mobileNo,
    'email_id': emailId,
    'city': city,
    'street': street,
    'password': password
  };
  body.removeWhere((String key, dynamic value) =>
      value == null || value == 'null' || value.isEmpty);

  print(body);

  http.Response response = await http.post('$url', body: body);

//  http.Response response = await http.post('$url/insert-user.php', body: body);

  if (response.body.contains("Error")) {
    throw Exception(response.body);
  } else {
    print('response ${response.body}');
    return response.body;
  }
}

Future<String> updateUser(
    {@required String firstName,
    String lastName,
    @required String id,
    @required String userType,
    @required String address,
    @required String pin,
    @required String mobileNo,
    @required String emailId,
    @required String city,
    @required String street,
    @required String password}) async {
  Map<String, dynamic> body = {
    'mode': 'update-user.php',
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'user_type': userType,
    'address': address,
    'PIN': pin,
    'mobile_no': mobileNo,
    'email_id': emailId,
    'city': city,
    'street': street,
    'password': password,
  };
  body.removeWhere((String key, dynamic value) =>
      value == null || value == 'null' || value.isEmpty);

  http.Response response = await http.post('$url', body: body);
  if (response.body.contains("Error")) {
    print('update ${response.body}');
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}

Future<User> login({String emailId, String password}) async {
  //TODO email id
  Map<String, String> body = {
    'mode': 'login_app',
    'email_id': emailId,
    'pass_word': password
  };
print('body is $body');
  var response = await http.post('$url', body: body);
  print('data is ${response.body}');
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    try {
      User user = serializers.deserializeWith(
          User.serializer, json.decode(response.body));
      print('user is $user');
      return user;
    } catch (e) {
      return null;
    }
  }
}

Future updateUserType({String id, UserType status, String parentId}) async {
  Map<String, String> body = {
    'mode': 'update-user-type.php',
    'id': id,
    'user_type': status.toString(),
    'parent_id': parentId
  };
  http.Response response =
      await http.post('$url/update-user-type.php', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}

Future updatePin({String id, String parentId}) async {
  Map<String, String> body = {
    'mode': 'add-pin.php',
    'id': id,
    'parent_id': parentId,
  };
  http.Response response = await http.post('$url/add-pin.php', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}

Future reportPost({String id, int total = 0, int report = 0}) async {
  Map<String, String> body = {
    'mode': 'report-user.php',
    'id': id,
    'report_post': report.toString(),
    'total_post': total.toString()
  };
  http.Response response = await http.post('$url/report-user.php', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}
