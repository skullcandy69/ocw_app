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
     // title: selectedIndex ==3 ?Center(child: Text('Booking')):Text(''),
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
                  color: Colors.white),
            ),
          ),
          Tab(
            child: Text(
              'All Post' + ' ' + '(${widget.allPostCount})',
              style: TextStyle(
                  color:Colors.white),
            ),
          ),
          Tab(
            child: Text(
              'All Requests' + ' ' + '(${widget.reportCount})',
              style: TextStyle(
                  color: Colors.white),
            ),
          ),
        ]
            : <Widget>[
          Tab(
            child: Text(
              'My Post' + ' ' + '(${widget.myPostCount})',
              style: TextStyle(
                  color:Colors.white),
            ),
          ),
          Tab(
            child: Text(
              'All Post' + ' ' + '(${widget.allPostCount})',
              style: TextStyle(
                  color: Colors.white ),
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
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: new Text(widget.user.fullName),
              decoration: BoxDecoration(color: Colors.black26),
              accountEmail: new Text(widget.user.emailId),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/profilepic1.png'),
              )),
          _createDrawerItem(
              icon: Icons.perm_contact_calendar,
              text: 'Profile',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            _scaffoldChild(ProfileContainer(),'Profile')));
              }),
          // _createDrawerItem(icon: Icons.history, text: 'History',onTap:),
          _createDrawerItem(
              icon: Icons.account_balance_wallet,
              text: 'Wallet',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            _scaffoldChild(WalletContainer(),'Wallet')));
              }),
          _createDrawerItem(
              icon: Icons.book,
              text: 'Booking',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            _scaffoldChild(BookingContainer(),'Booking')));
              }),
          _createDrawerItem(
              icon: Icons.local_post_office,
              text: 'Posts',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            _scaffoldChild(
                                NotificationContainer(
                                    widget.user.isClient ? false : true),'Posts')));
              }),
          _createDrawerItem(
              icon: Icons.exit_to_app,
              text: 'Logout',
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LogoutDialog(widget.logout);
                    });
              }),
        ],
      ),
    );
  }

  Widget _createDrawerItem({IconData icon, String text, Function onTap}) {
    return InkWell(
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
            SizedBox(width: 20,),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(text),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _scaffoldChild(Widget widget,String text) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
      ),
      body: widget,
    );
  }

}