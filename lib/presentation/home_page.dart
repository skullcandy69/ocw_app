import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ocw_app/containers/booking_container.dart';
import 'package:ocw_app/containers/home_container.dart';
import 'package:ocw_app/containers/notification_container.dart';
import 'package:ocw_app/containers/profile_page_container.dart';
import 'package:ocw_app/containers/request_container.dart';
import 'package:ocw_app/containers/wallet_container.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/presentation/body.dart';
import 'package:ocw_app/presentation/function/wil_pop_scope.dart';
import 'package:ocw_app/presentation/profile/logout_dialog.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:ocw_app/utils/size_config.dart';
import 'package:ocw_app/utils/string.dart';

class HomePage extends StatefulWidget {
  final User user;
  final Function onLoadingComplete;
  final Function onExit;
  final String allPostCount;
  final String myPostCount;
  final String reportCount;
  final Function logout;

  HomePage(this.user, this.onLoadingComplete, this.onExit, this.allPostCount,
      this.myPostCount, this.reportCount, this.logout);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int selectedIndex = 0;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: widget.user.userType == UserType.admin ? 3 : 2,
        initialIndex: 1,
        vsync: this);

    broadcasterService.on(BroadcasterEventType.onExitSession).listen((data) {
      if (mounted) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return Exit(widget.onExit);
            });
      },
      child: SafeArea(
        child: Scaffold(
            bottomNavigationBar: FancyBottomNavigation(
              tabs: [
                TabData(iconData: Icons.home, title: StringValue.homePage),
                TabData(iconData: Icons.map, title: StringValue.postPage),
                TabData(
                    iconData: Icons.account_circle,
                    title: StringValue.profilePage),
                TabData(iconData: Icons.add, title: StringValue.bookingPage),
              ],
              onTabChangedListener: (int newIndex) {
                setState(() {
                  selectedIndex = newIndex;
                });
              },
            ),
            drawer: _drawer(),
            appBar: _appBar(),
            body: selectedIndex == 1
                ? widget.user.isClient
                    ? NotificationContainer(false)
                    : widget.user.userType == UserType.admin
                        ? TabBarView(
                            controller: tabController,
                            children: <Widget>[
                              NotificationContainer(false),
                              NotificationContainer(true),
                              RequestContainer()
                            ],
                          )
                        : TabBarView(
                            controller: tabController,
                            children: <Widget>[
                              NotificationContainer(false),
                              NotificationContainer(true),
                            ],
                          )
                : Body(selectedIndex)),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      bottom: selectedIndex == 1
          ? widget.user.isClient
              ? PreferredSize(
                  child: Container(),
                  preferredSize: Size.fromHeight(0),
                )
              : TabBar(
                  indicatorColor: Colors.greenAccent,
                  controller: tabController,
                  tabs: widget.user.userType == UserType.admin
                      ? <Widget>[
                          Tab(
                            child: Text(
                              'My Post' + ' ' + '(${widget.myPostCount})',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'All Post' + ' ' + '(${widget.allPostCount})',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'All Requests' + ' ' + '(${widget.reportCount})',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ]
                      : <Widget>[
                          Tab(
                            child: Text(
                              'My Post' + ' ' + '(${widget.myPostCount})',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'All Post' + ' ' + '(${widget.allPostCount})',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                )
          : PreferredSize(
              child: Container(),
              preferredSize: Size.fromHeight(0),
            ),
      actions: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 10),
          child: Text(
            widget.user.fullName,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.only(
          top: SizeConfig.screenHeight * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    height: SizeConfig.screenHeight * 0.2,
                    width: SizeConfig.screenWidth * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.screenHeight * 0.1),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/profilepic1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    widget.user != null ? widget.user.fullName : '',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.1),
              child: Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            _drawerOptions(StringValue.homePage, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          _scaffoldChild(HomeContainer())));
            }),
            _drawerOptions(StringValue.bookingPage, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          _scaffoldChild(BookingContainer())));
            }),
            _drawerOptions(StringValue.profilePage, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          _scaffoldChild(ProfileContainer())));
            }),
            _drawerOptions(StringValue.walletPage, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          _scaffoldChild(WalletContainer())));
            }),
            _drawerOptions(StringValue.historyPage, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => _scaffoldChild(
                          NotificationContainer(
                              widget.user.isClient ? false : true))));
            }),
            _drawerOptions(StringValue.logOut, () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LogoutDialog(widget.logout);
                  });
            }),
          ],
        ),
      ),
    );
  }

  Widget _scaffoldChild(Widget widget) {
    return Scaffold(
      body: widget,
    );
  }

  Widget _drawerOptions(String text, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.all(
          SizeConfig.screenHeight * 0.01,
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
