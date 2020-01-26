import 'package:flutter/material.dart';
import 'package:ocw_app/containers/home_page_container.dart';
import 'package:ocw_app/containers/signup_container.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:ocw_app/utils/size_config.dart';
import 'package:ocw_app/utils/string.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  final Function onLogin;
  final bool isLoggingIn;
  final bool isLoggedIn;

  LoginPage({this.onLogin, this.isLoggingIn, this.isLoggedIn})
      : super(key: Key(isLoggingIn.toString()));

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String password = '';
  String id = '';
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  bool isLoggingIn = false;

  @override
  void initState() {
    super.initState();
    broadcasterService.on(BroadcasterEventType.onLogin).listen((data) {
      print('came ');
      if (_focusNode2.hasFocus) {
        _focusNode2.unfocus();
      }
      if (_focusNode.hasFocus) {
        _focusNode.unfocus();
      }

      _navigateToHomePage(context);
    });
    broadcasterService.on(BroadcasterEventType.onError).listen((data) {
      if (mounted) {
        _formKey.currentState.save();
        if (data.data['type'] == 'login') {
          Toast.show(data.data['Error'], context);
          setState(() {
            isLoggingIn = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20)),
          child: login(),
        ),
      ),
    );
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePageContainer.routeNamed);
  }

  Widget login() {
    return Container(
      width: SizeConfig.screenWidth * 0.8,
      child: Form(
        key: _formKey,
        autovalidate: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: SizeConfig.screenWidth,
              child: Text(
                StringValue.emailId,
                style: TextStyle(color: Colors.blue, fontSize: 18.0),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Center(
                child: TextFormField(
                  enabled: !isLoggingIn,
                  focusNode: _focusNode2,
                  onSaved: (String value) {
                    id = value.trim();
                    _focusNode2.unfocus();
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: SizeConfig.screenWidth,
              child: Text(
                StringValue.password,
                style: TextStyle(color: Colors.blue, fontSize: 18.0),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Center(
                child: TextFormField(
                  enabled: !isLoggingIn,
                  focusNode: _focusNode,
                  obscureText: true,
                  onSaved: (String value) {
                    password = value.trim();
                    _focusNode.unfocus();
                  },
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              color: const Color.fromRGBO(50, 152, 219, 1),
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              onPressed: () {
                _formKey.currentState.save();
                _focusNode.unfocus();
                if (_formKey.currentState.validate()) {
                  print('id is  page $id , password is $password');

                  widget.onLogin(id, password);
                  setState(() {
                    isLoggingIn = true;
                  });
                }
              },
              child: Container(
                height: 50.0,
                child: Center(
                  child: isLoggingIn
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(
                          StringValue.login,
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignUpContainer.routeNamed);
                },
                child: Container(
                  child: Text(
                    StringValue.createAccount,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
