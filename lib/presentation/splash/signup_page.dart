import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ocw_app/containers/home_page_container.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:ocw_app/utils/size_config.dart';
import 'package:ocw_app/utils/string.dart';
import 'package:toast/toast.dart';

class SignUpPage extends StatefulWidget {
  final Function signUpComplete;
  final bool isLoggingIn;

  SignUpPage({this.isLoggingIn = false, this.signUpComplete});

  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUpPage> {
  String email, firstName, lastName, address, street;
  String mobileNo, pin, city, password, confirmPassword;
  bool isLogging = false;
  UserType userType = UserType.client;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    broadcasterService.on(BroadcasterEventType.onSignUp).listen((data) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, HomePageContainer.routeNamed);
      }
    });
    broadcasterService.on(BroadcasterEventType.onError).listen((data) {
      if (mounted) {
        if (data.data['type'] == 'signup') {
          Toast.show(data.data['Error'], context);
          setState(() {
            isLogging = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: SizeConfig.screenWidth,
            padding: EdgeInsets.all(10),
            child: Form(
              onChanged: () => _formKey.currentState.validate(),
              key: _formKey,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: SizeConfig.screenHeight * 0.15,
                        width: SizeConfig.screenHeight * 0.15,
                        child: Image.asset("assets/default.png"),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.03,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          validator: (value) {
                            String pattern = r'[A-Z][a-zA-Z][^#&<>\"~;$^%{}?]{1,20}$';
                            RegExp rx = new RegExp (pattern);
                            if (value.isEmpty) {
                              return 'First name required'; //StringUtil.FIRST_NAME_REQUIRED_TEXT;
                            } else if (!rx.hasMatch(value)) {
                              return 'Enter a valid name';
                            }

                            return null;
                          },
                          onSaved: (data) {
                            firstName = data;
                          },
                          onEditingComplete: () =>
                              _formKey.currentState.validate(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'First Name',
                            //StringUtil.FIRST_NAME_TEXT,
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
//                            errorText:
//                                _getErrorMessage(networkError, 'first_name')
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          validator: (value) {
                            String pattern = r'[A-Z][a-zA-Z][^#&<>\"~;$^%{}?]{1,20}$';
                            RegExp rx = new RegExp(pattern);
                            if (!rx.hasMatch(value)) {
                              return 'Enter a valid name';
                            }

                            return null;
                          },
                          onSaved: (data) {
                            lastName = data;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Last name',
                            //StringUtil.LAST_NAME_TEXT,
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'Address is required'; //StringUtil.AGE_REQUIRED_TEXT;
                            }

                            return null;
                          },
                          onSaved: (String data) {
                            street = data.trim();
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Street No ',
                            //StringUtil.AGE_TEXT,
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'This is required'; //StringUtil.AGE_REQUIRED_TEXT;
                            }

                            return null;
                          },
                          onSaved: (String data) {
                            city = data.trim();
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'City',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: TextFormField(
//                          maxLines: 4,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'This is required'; //StringUtil.AGE_REQUIRED_TEXT;
                            } else if (value.trim().length < 10) {
                              return "Enter at least 10 characters";
                            }

                            return null;
                          },
                          onSaved: (String data) {
                            address = data.trim();
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Address',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'Email is required'; //StringUtil.AGE_REQUIRED_TEXT;
                            }

                            return null;
                          },
                          onSaved: (String data) {
                            email = data.trim();
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'E-mail Id', //StringUtil.AGE_TEXT,
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: TextFormField(
                          maxLength: 6,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'PIN code is required'; //StringUtil.AGE_REQUIRED_TEXT;
                            }

                            return null;
                          },
                          onSaved: (String data) {
                            pin = data.trim();
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintText: 'PIN', //StringUtil.AGE_TEXT,
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: TextFormField(
                          maxLength: 10,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (String value) {
                            String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            RegExp regExp = new RegExp(pattern);
                            if (value.trim().isEmpty) {
                              return 'Mobile Number is required'; //StringUtil.AGE_REQUIRED_TEXT;
                            } else if (value.trim().length < 10) {
                              return "Enter 10 digits";
                            } else if (!regExp.hasMatch(value)) {
                              return 'Please enter valid mobile number';
                            }

                            return null;
                          },
                          onSaved: (String data) {
                            mobileNo = data.trim();
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintText: 'Mobile Number', //StringUtil.AGE_TEXT,
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'This is required'; //StringUtil.AGE_REQUIRED_TEXT;
                            }
                            if (confirmPassword != password) {
                              return 'Password don\'t match';
                            }
                            return null;
                          },
                          onSaved: (String data) {
                            password = data.trim();
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'This is required'; //StringUtil.AGE_REQUIRED_TEXT;
                            }
                            if (confirmPassword != password) {
                              return 'Password don\'t match';
                            }

                            return null;
                          },
                          onSaved: (String data) {
                            confirmPassword = data.trim();
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                          child: isLogging
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )
                              : Text(
                                  StringValue.signUp,
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                        onPressed: () {
                          if (!isLogging) {
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                isLogging = true;
                              });
                              widget.signUpComplete(
                                  phoneNumber: mobileNo,
                                  firstName: firstName,
                                  lastName: lastName,
                                  emailId: email,
                                  street: street,
                                  userType: userType,
                                  address: address,
                                  pin: pin,
                                  city: city,
                                  password: password);
                            }
                          }
                        },
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
