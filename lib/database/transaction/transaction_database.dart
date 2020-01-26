import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:built_collection/built_collection.dart';
import 'package:ocw_app/models/transaction/transaction.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/serializers/serializers.dart';
import 'package:ocw_app/serializers/types.dart';
import 'package:ocw_app/utils/globals.dart';

Future<String> createTransaction(
    {String receiverId,
    String amount,
    TransactionStatus status,
    String name,
    String senderId}) async {
  Map<String, String> body = {
    'receiver_id': receiverId,
    'mode': 'create-transaction',
    'amount': amount,
    'status': status.toString(),
    'sender_id': senderId,
    'name': name
  };
  http.Response response = await http.post('$url', body: body);
  print(response.body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}

Future<List<Transaction>> getAllTransaction(String id) async {
  Map<String, String> body = {'id': id, 'mode': 'transaction'};
  http.Response response = await http.post('$url', body: body);

  List<Transaction> data = (serializers.deserialize(jsonDecode(response.body),
          specifiedType: transactionList) as BuiltList<Transaction>)
      .toList();
  return data;
}

Future updateTransaction({String id, TransactionStatus status}) async {
  Map<String, String> body = {
    'id': id,
    'mode': 'transaction-update',
    'status': status.toString()
  };
  http.Response response = await http.post('$url', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}
