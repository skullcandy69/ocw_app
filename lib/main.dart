import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocw_app/actions/actions.dart';
import 'package:ocw_app/containers/booking_container.dart';
import 'package:ocw_app/containers/home_page_container.dart';
import 'package:ocw_app/containers/login_container.dart';
import 'package:ocw_app/containers/signup_container.dart';
import 'package:ocw_app/containers/splash_container.dart';
import 'package:ocw_app/containers/wallet_container.dart';
import 'package:ocw_app/presentation/splash/fp.dart';
import 'package:ocw_app/utils/globals.dart';

import 'presentation/home_page.dart';
import 'utils/string.dart';

class OlaCarWash extends StatelessWidget {
//  void grantPermission() async {
//    final PermissionHandler _permissionHandler = PermissionHandler();
//    await _permissionHandler.requestPermissions([
//      PermissionGroup.storage,
//      PermissionGroup.phone,
//      PermissionGroup.location,
//    ]);
//  }

  @override
  Widget build(BuildContext context) {
    store.dispatch(CheckSession());
//    grantPermission();
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,color: Colors.greenAccent,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.white,
          ),
        ),
        title: StringValue.appTitle,
        initialRoute: FrontPage.routeNamed,
        routes: {
          FrontPage.routeNamed: (BuildContext context) => FrontPage(),
          SplashContainer.routeNamed: (BuildContext context) =>
              SplashContainer(),
          BookingContainer.routeNamed: (BuildContext context) =>
              BookingContainer(),
          WalletContainer.routeNamed: (BuildContext context) =>
              WalletContainer(),
          HomePageContainer.routeNamed: (BuildContext context) =>
              HomePageContainer(),
          SignUpContainer.routeNamed: (BuildContext context) =>
              SignUpContainer(),
          LoginContainer.routeNamed: (BuildContext context) => LoginContainer(),
        },
      ),
    );
  }
}
