import 'dart:convert';

import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/serializers/serializers.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferencesService {
  PreferencesService._();

  static final PreferencesService _instance = PreferencesService._();

  factory PreferencesService.getInstance() => _instance;

  static const AUTH_TOKEN = "auth_token";
  static const LOGGED_IN_USER = "logged_in_user";
  static const LIKED_POSTS = "liked_posts";
  static const PRICE_TAG = "price_tag";
  static const VIEWED_POST = "view_post";

  bool isAppDisabled = false;

  void setViewedPost(String postId) async {
    await getViewedPostList().then((List<dynamic> list) async {
      list.add(postId);
      (await _getInstance()).setString(VIEWED_POST, json.encode(list));
    });
  }

  Future<List<dynamic>> getViewedPostList() async {
    return await _getInstance() == null
        ? List<String>()
        : (await _getInstance()).get(VIEWED_POST) == null
            ? List<String>()
            : json.decode((await _getInstance()).get(VIEWED_POST)) == null
                ? List<String>()
                : json.decode((await _getInstance()).get(VIEWED_POST));
  }

  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  setAuthUser(User user) async {
    (await _getInstance()).setString(PreferencesService.LOGGED_IN_USER,
        json.encode(serializers.serializeWith(User.serializer, user)));
  }

  Future<User> getAuthUser() async {
    final user =
        (await _getInstance()).getString(PreferencesService.LOGGED_IN_USER);
    if (user == null) {
      return null;
    }
    return serializers.deserializeWith(User.serializer, json.decode(user));
  }

  Future<PriceTag> getPriceTag() async {
    final priceTag =
        (await _getInstance()).getString(PreferencesService.PRICE_TAG);
    if (priceTag == null) {
      return null;
    }
    return serializers.deserializeWith(
        PriceTag.serializer, json.decode(priceTag));
  }

  Future logout() async {
    final lg = await _getInstance();
    lg.clear();
  }
}
