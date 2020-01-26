import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ocw_app/middleware/app_middleware.dart';
import 'package:ocw_app/middleware/post_middleware.dart';
import 'package:ocw_app/middleware/request_middleware.dart';
import 'package:ocw_app/middleware/user_middleware.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/call.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/service/notification_service.dart';
import 'package:ocw_app/service/preference_service.dart';
import 'package:redux/redux.dart';
import 'package:ocw_app/reducers/app_state_reducer.dart';

final store =
    Store<AppState>(appReducer, initialState: AppState(), middleware: [
  appMiddleware,
  userMiddleware,
  postMiddleware,
  requestMiddleware,
]);

final preferenceService = PreferencesService.getInstance();
final broadcasterService = BroadcasterService.getInstance();
final notificationService = NotificationService.getInstance();
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

enum ReportType { post, comment, letter, mailing_list, user }

const String url = 'https://cleanngo.in/inside/ajax/ajax_app';

GetIt locator = GetIt.instance;

Call callService = locator<Call>();

void setupLocator() {
  locator.registerSingleton(Call());
}
