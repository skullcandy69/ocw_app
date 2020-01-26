import 'dart:async';

import 'package:ocw_app/network/api_service.dart';



class ApiClient extends APIService {
  ApiClient._();

  static final ApiClient _instance = ApiClient._();

  factory ApiClient.getInstance() => _instance;

  Future<Map<String, dynamic>> apkUrl() async {
    final response = await this.get("/getUser", useAuthHeaders: true);
    return response;
  }

  Future<Map<String, dynamic>> getVideos() async {
    final response = await this
        .get("/getVideo", useAuthHeaders: false, params: {"user_id": "1"});
    return response;
  }
}
