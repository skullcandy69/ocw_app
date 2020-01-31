import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocw_app/containers/splash_container.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/presentation/profile/logout_dialog.dart';
import 'package:ocw_app/presentation/profile/request_for_pin_access.dart';
import 'package:ocw_app/presentation/profile/upgrade_type.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:ocw_app/utils/size_config.dart';
import 'package:ocw_app/utils/string.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class ProfilePage extends StatefulWidget {
  final User user;
  final Function updateUser;
  final Function logout;
  final Function createRequest;

  ProfilePage({this.user, this.updateUser, this.logout, this.createRequest});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  User user;

  bool _status = true;
  FocusNode myFocusNode;
  File _image;
  AnimationController _controller;

  TextEditingController textEditingController = TextEditingController();
  bool isLoggingOut = false;

  String referenceId = '';
  UserType _picked;
  final _formKey = GlobalKey<FormState>();

  bool isUserUpdate = false;
  bool isUserTypeChanging = false;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    _picked = widget.user.userType == UserType.client
        ? UserType.freelancer
        : widget.user.userType == UserType.freelancer
            ? UserType.franchise
            : UserType.freelancer;

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    myFocusNode = FocusNode();
    broadcasterService.on(BroadcasterEventType.onLogout).listen((data) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, SplashContainer.routeNamed);
      }
    });
    broadcasterService.on(BroadcasterEventType.onUpdateUser).listen((data) {
      if (mounted)
        setState(() {
          _status = true;
          isUserUpdate = false;
        });
    });

    broadcasterService.on(BroadcasterEventType.onError).listen((data) {
      if (mounted)
        setState(() {
          isUserUpdate = false;
          _status = true;
        });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 4.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(200, 120),
            bottomRight: Radius.elliptical(200, 120)),
        color: Colors.black38,
      ),
      child: Center(
          child: AutoSizeText(
        widget.user.fullName,
        style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w200),
      )),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: new Center(
        child: _image == null
            ? new Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: SizeConfig.screenWidth * 0.4,
                      height: SizeConfig.screenHeight * 0.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/profilepic1.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(
                              SizeConfig.screenWidth * 0.4),
                          border: Border.all(color: Colors.white, width: 10)),
                    ),
                  )
                ],
              )
            : new Container(
                height: SizeConfig.screenWidth * 0.4,
                width: SizeConfig.screenHeight * 0.2,
                decoration: new BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: new DecorationImage(
                      image: new ExactAssetImage(_image.path),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                        BorderRadius.circular(SizeConfig.screenWidth * 0.4),
                    border: Border.all(color: Colors.white, width: 10)),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: _body(screenSize),
    );
  }

  Widget _body(Size screenSize) {
    return Container(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: isLoggingOut
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(children: <Widget>[
                Stack(
                  children: <Widget>[
                    _buildCoverImage(screenSize),
                    SafeArea(
                        child: SingleChildScrollView(
                            child: Column(
                      children: <Widget>[
                        SizedBox(height: screenSize.height / 7),
                        _buildProfileImage(),
                        new Container(
                            padding: EdgeInsets.only(bottom: 25.0),
                            child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 10.0),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                StringValue.personalInformation,
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              _status
                                                  ? _getEditIcon()
                                                  : new Container(),
                                            ],
                                          )
                                        ],
                                      )),
                                ])),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 10.0),
                            child: new Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Icon(Icons.perm_identity),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    new Text(
                                      'ID:',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    new Text(
                                      widget.user.id,
                                      maxLines: null,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Divider(
                          height: 5,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 25.0,
                              right: 25.0,
                            ),
                            child: new Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    InkWell(child: Icon(Icons.home)),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    new Flexible(
                                      child: new TextFormField(
                                        initialValue: widget.user.address,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 2,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Your Address",
                                        ),
                                        enabled: !_status,
                                        autofocus: !_status,
                                        onSaved: (data) {
                                          user = user.rebuild((b) {
                                            b..address = data.trim();
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Divider(),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 25.0,
                              right: 25.0,
                            ),
                            child: new Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Icon(
                                      Icons.phone_android,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    new Flexible(
                                      child: new TextFormField(
                                        initialValue: widget.user.phoneNumber,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500),
                                        keyboardType: TextInputType.phone,
                                        validator: (String value) {
                                          String pattern =
                                              r'(^(?:[+0]9)?[0-9]{10,12}$)';
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
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Your PhoneNumber",
                                        ),
                                        enabled: !_status,
                                        autofocus: !_status,
                                        onSaved: (data) {
                                          user = user.rebuild((b) =>
                                              b..phoneNumber = data.trim());
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                          ),
                          child: new Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Icon(Icons.email),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  new Flexible(
                                    child: new TextFormField(
                                      initialValue: widget.user.emailId,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter Your EmailId",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,
                                      onSaved: (data) {
                                        user = user.rebuild(
                                            (b) => b..emailId = data.trim());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        widget.user.userType == UserType.client ||
                                widget.user.userType == UserType.admin
                            ? Divider()
                            : Container(),
                        widget.user.userType == UserType.client ||
                                widget.user.userType == UserType.admin
                            ? Container()
                            : _status
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 10),
                                    child: new Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Icon(
                                              Icons.pin_drop,
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            widget.user.userType ==
                                                    UserType.admin
                                                ? new Text(
                                                    'Request For More Pin Access',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                : InkWell(
                                                    child: new Text(
                                                      'Request For More Pin Access',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return PinType(
                                                                widget
                                                                    .createRequest,
                                                                widget.user);
                                                          });
                                                    },
                                                  ),
                                          ],
                                        ),
                                        Divider(),
                                      ],
                                    ))
                                : Container(),
                        Divider(),
                        _status
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 10),
                                child: new Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Icon(
                                          Icons.verified_user,
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        widget.user.userType == UserType.admin
                                            ? new Text(
                                                UserType.displayValueOf(
                                                    widget.user.userType),
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            : InkWell(
                                                child: new Text(
                                                  UserType.displayValueOf(
                                                      widget.user.userType),
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return UpgradeType(
                                                            widget
                                                                .createRequest,
                                                            widget.user);
                                                      });
                                                },
                                              ),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ))
                            : Container(),
                        !_status
                            ? (Padding(
                                padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                ),
                                child: new Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Icon(Icons.settings_input_component),
                                        SizedBox(
                                          width: 50,
                                        ),
//
                                        new Flexible(
                                          child: new TextFormField(
                                            obscureText: true,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Current Password",
                                            ),
                                            validator: (String data) {
                                              if (data.isNotEmpty) {
                                                if (data !=
                                                    widget.user.password) {
                                                  return 'Password didn\'t matched';
                                                }
                                              }

                                              return null;
                                            },
                                            enabled: !_status,
                                            autofocus: !_status,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )))
                            : Container(),
                        !_status
                            ? Padding(
                                padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                ),
                                child: new Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Icon(Icons.arrow_forward),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        new Flexible(
                                          child: new TextFormField(
                                            obscureText: true,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "New Password",
                                            ),
                                            enabled: !_status,
                                            autofocus: !_status,
                                            onSaved: (data) {
                                              if (data.trim().isNotEmpty) {
                                                user = user.rebuild(
                                                    (b) => b..password = data);
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                            : Container(),
                        _status
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 10),
                                child: new Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Icon(Icons.open_in_browser),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        InkWell(
                                            child: new Text(
                                              'For any queries visit our site',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            onTap: () => url_launcher.launch(
                                                "https://door2doorcarwash.com/")),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ))
                            : Container(),
                        _status
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 10),
                                child: new Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Icon(Icons.info_outline),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        InkWell(
                                            child: new Text(
                                              'About Us',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            onTap: () => url_launcher.launch(
                                                "https://github.com/shushant-1/door2door")),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ))
                            : Container(),
//                        _status
//                            ? (Padding(
//                                padding: EdgeInsets.only(
//                                    left: 25.0, right: 25.0, top: 10),
//                                child: new Column(
//                                  mainAxisSize: MainAxisSize.max,
//                                  mainAxisAlignment:
//                                      MainAxisAlignment.spaceBetween,
//                                  children: <Widget>[
//                                    new Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.start,
//                                      mainAxisSize: MainAxisSize.max,
//                                      children: <Widget>[
//                                        Icon(Icons.remove_circle_outline),
//                                        SizedBox(
//                                          width: 50,
//                                        ),
//                                        InkWell(
//                                          child: new Text(
//                                            'Logout',
//                                            style: TextStyle(
//                                                fontSize: 16.0,
//                                                fontWeight: FontWeight.w500),
//                                          ),
//                                          onTap: () {
//                                            showDialog(
//                                                context: context,
//                                                builder:
//                                                    (BuildContext context) {
//                                                  return LogoutDialog(
//                                                      widget.logout);
//                                                });
//                                          },
//                                        ),
//                                      ],
//                                    ),
//                                  ],
//                                )))
//                            : Container(),
                        SizedBox(
                          height: 5,
                        ),
                        !_status ? _getActionButtons() : new Container(),
                      ],
                    )))
                  ],
                ),
              ]),
      ),
    );
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0, bottom: 30),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    child: isUserUpdate
                        ? CircularProgressIndicator()
                        : Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate() && !isUserUpdate) {
                        setState(() {
                          isUserUpdate = true;
                          FocusScope.of(context).requestFocus(new FocusNode());
                        });
                        print('before $user');
                        widget.updateUser(user);
                      }
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
