import 'package:flutter/material.dart';
import 'package:ocw_app/containers/home_page_container.dart';
import 'package:ocw_app/containers/login_container.dart';
import 'package:ocw_app/utils/size_config.dart';
import 'package:ocw_app/utils/string.dart';

class PromptSignUpPage extends StatelessWidget {
  static const String routeNamed = 'Splash Sign Up';
  final bool isLoggedIn;

  PromptSignUpPage({this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return isLoggedIn
        ? HomePageContainer()
        : SafeArea(
            child: Scaffold(
                body: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, LoginContainer.routeNamed);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.5,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: Text(
                            StringValue.welcomeMessage,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.07,
                        ),
                        RaisedButton(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black12)),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginContainer.routeNamed);
                          },
                          color: Theme.of(context).primaryColor,
                          child: Container(
                              decoration: BoxDecoration(),
                              alignment: Alignment.center,
                              width: SizeConfig.screenWidth * 0.5,
                              height: SizeConfig.screenHeight * 0.07,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          );
  }
}
