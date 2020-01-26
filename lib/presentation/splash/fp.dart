import 'package:flutter/material.dart';
import 'package:ocw_app/containers/home_page_container.dart';
import 'package:ocw_app/containers/splash_container.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/presentation/splash/loader.dart';
import 'package:ocw_app/utils/globals.dart';

class FrontPage extends StatefulWidget {
  static const String routeNamed = 'Front page';

  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration d) {
      preferenceService.getAuthUser().then((User user) {
        Future.delayed((Duration(seconds: 5)), () {
          if (user != null) {
            Navigator.pushReplacementNamed(
                context, HomePageContainer.routeNamed);
          } else {
            Navigator.pushReplacementNamed(context, SplashContainer.routeNamed);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/pp.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(80),
                    border: Border.all(color: Colors.black38, width: 10)),
              ),
              SizedBox(
                height: 200,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[Loader()],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
