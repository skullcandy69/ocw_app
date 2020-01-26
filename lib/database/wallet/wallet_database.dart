import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/serializers/serializers.dart';
import 'package:ocw_app/serializers/types.dart';
import 'package:ocw_app/utils/globals.dart';

Future<List<PriceTag>> getPriceService() async {
  Map<String, String> body = {'mode': 'fetch-pricing'};
  http.Response response = await http.post('$url', body: body);
  List<PriceTag> priceTag = (serializers.deserialize(jsonDecode(response.body),
          specifiedType: priceTagList) as BuiltList<PriceTag>)
      .toList();
  return priceTag;
}

Future<String> insertWallet({
  @required String firstName,
  String lastName,
  @required String userType,
  @required String address,
  @required String pin,
  @required String mobileNo,
  @required String emailId,
  @required String city,
  @required String street,
}) async {
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
    'street': street
  };
  body.removeWhere((String key, dynamic value) =>
      value == null || value == 'null' || value.isEmpty);

  http.Response response = await http.post('$url', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}

Future sendMoney({String id, String amount}) async {
  Map<String, String> body = {
    'id': id,
    'amount': amount,
    'mode': 'added-wallet-value'
  };
  http.Response response = await http.post('$url', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}

Future deductMoney({String id, String amount}) async {
  Map<String, String> body = {
    'id': id,
    'amount': amount,
    'mode': 'subtract-wallet-value'
  };
  http.Response response = await http.post('$url', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}
