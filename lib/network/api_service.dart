import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ocw_app/app_config.dart';

String baseUrl = AppConfig.baseUrl;

abstract class APIService {
  Future<Map<String, dynamic>> get(String url,
      // ignore: avoid_init_to_null
      {Map<String, String> params = null,
      bool useAuthHeaders = true}) async {
    return this._getResponse(await http.get(
      this._getUrlWithParams(url, params: params),
    ));
  }

  Future<Map<String, dynamic>> post(String url,
      {@required body, bool useAuthHeaders = true}) async {
    final response =
        await http.post(this._getUrl(url), body: json.encode(body));

    return this._getResponse(response);
  }

  // Helper Methods for API Services
  String _getUrl(String url) {
    return baseUrl + url;
  }

  String _getUrlWithParams(url, {Map<String, String> params}) {
    var absUrl = this._getUrl(url);

    if (params != null) {
      var paramsString = "";
      params.forEach((key, value) {
        paramsString += "&$key=$value";
      });

      return absUrl + "?" + paramsString.substring(1);
    }

    return absUrl;
  }

  Map<String, dynamic> _getResponse(http.Response response) {
    final body = json.decode(response.body);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(body["message"]);
    }

    return body;
  }
}
