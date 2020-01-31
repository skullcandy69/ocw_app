import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/models/vehicle/vehicle_type.dart';
import 'package:ocw_app/presentation/function/dialog_box.dart';
import 'package:ocw_app/presentation/home/car_show_widget.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:ocw_app/utils/size_config.dart';

class Home extends StatefulWidget {
  final Map<VehicleType, PriceTag> priceTag;
  final Function function;
  final String allPostCount;
  final String myPostCount;
  final String reportCount;

  Home(
    this.priceTag,
    this.function,
    this.allPostCount,
    this.myPostCount,
    this.reportCount,
  );

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController scrollController = ScrollController();
  bool isTapped = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    broadcasterService.on(BroadcasterEventType.onChange).listen((data) {
      if (mounted) {
        print('hh');
        isTapped = false;
//        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int sum = int.parse(widget.reportCount) + int.parse(widget.allPostCount);
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          sum > 0
              ? Container(
                  color: Colors.black,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _notification(
                          'Posts',
                          widget.allPostCount,
                        ),
                        _notification(
                          'Requests',
                          widget.reportCount,
                        ),
                        _notification(
                          'Reports',
                          widget.reportCount,
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          CardGit(),
          Flexible(
            child: Container(
              child: RefreshIndicator(
                onRefresh: _handleRefresh,
                child: ListView(
                  controller: scrollController,
                  children: <Widget>[
                    Divider(
                      height: 2,
                      color: Colors.black54,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                          child: new Text(
                        'TAP TO VIEW PRICE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                    ),
                    Divider(
                      height: 2,
                    ),
                    CarShowWidget(widget.priceTag, (priceTag) {
                      setState(() {
                        isTapped = true;
                      });
                      showBottomSheet(
                          context: context,
                          builder: (BuildContext context) => isTapped
                              ? BookDialog(
                                  title: 'Silver 10% off',
                                  desc: '',
                            pbt: "Book your service",
                                )
                              : SizedBox());
                    }),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => webview(
                                          'https://olacarwash.com/packages')),
                                );
                              },
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.open_in_new),
                                  Text('See All Packages')
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => webview(
                                          'https://olacarwash.com/prices')),
                                );
                              },
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.open_in_new),
                                  Text('See Price @car')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
//                    detailContainer(
//                      image:
//                          "https://door2doorcarwash.com/inside/images/services/steam-bonet.gif",
//                      description:
//                          "This eliminates dirt easily,\n while reaching those areas is very easy to reach",
//                      highlight:
//                          "The secret of steam cleaning \ndepends on the combination of steam and its temperature.",
//                      title: "STEAM WASH\n",
//                    ),
//                    detailContainer(
//                      image:
//                          "https://door2doorcarwash.com/inside/images/services/steam-interior-front-seat.gif",
//                      title: "STEAM INTERIOR \n",
//                      highlight:
//                          "Choosing steam cleaning for your car is really an excellent choice. ",
//                      description:
//                          "Steam air is produced, so heat naturally kills any bacteria or virus in the air.",
//                    ),
//                    detailContainer(
//                      image:
//                          "https://door2doorcarwash.com/inside/images/services/rubbing-car.gif",
//                      highlight:
//                          "Choosing steam cleaning for your car is really an excellent choice. ",
//                      title: "RUBBING & POLISHING\n",
//                      description:
//                          "Steam air is produced, so heat naturally kills any bacteria or virus in the air.",
//                    ),
//                    detailContainer(
//                      image:
//                          "https://door2doorcarwash.com/inside/images/services/foam-car.gif",
//                      title: "FOAM CAR WASH\n",
//                      highlight:
//                          " Pre-foam wash is the secret of professional to reduce scratch on every car wash. ",
//                      description:
//                          "Foam gently breaks down intense filth and grime, and rinses clean to reveal the beautiful surface.",
//                    ),
//                    detailContainer(
//                      image:
//                          "https://door2doorcarwash.com/inside/images/services/steam-engine.gif",
//                      highlight:
//                          "Your car engine has fluid stains, both can be more flammable.",
//                      title: "ENGINE STEAM\n",
//                      description:
//                          "You can reduce the risk of engine fire by cleaning the car engine steam.",
//                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _notification(String text, String widget) {
    var s = int.parse(widget);
    return Row(
      children: <Widget>[
        Container(
          height: 20,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        s > 0
            ? Icon(
                Icons.notifications_active,
                color: Colors.red,
                size: 15,
              )
            : Container()
      ],
    );
  }

  Future<Null> _handleRefresh() async {
    widget.function();
    await new Future.delayed(new Duration(seconds: 3));

    return null;
  }

  Widget detailContainer(
      {String image, String title, String description, String highlight}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 250,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Container(
                              child: Text(
                            '$title \n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold),
                          )),
                          Container(
                              child: Text(
                            highlight,
                            style: TextStyle(
                              color: Colors.blue, //Color(0xffe6020a),
                              fontSize: 20.0,
                            ),
                          )),
                          Container(
                              child: Text(
                            description,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 230,
                    height: 250,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: image,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class CardGit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl:
                'https://door2doorcarwash.com/inside/images/services/rubbing-car.gif',
          ),
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl:
                'https://door2doorcarwash.com/inside/images/services/rubbing-car.gif',
          ),
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl:
                'https://door2doorcarwash.com/inside/images/services/rubbing-car.gif',
          ),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 500),
        dotSize: 4,
        borderRadius: true,
        indicatorBgPadding: 6,
      ),
    );
  }
}

class webview extends StatelessWidget {
  final String url;

  webview(this.url);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appCacheEnabled: true,
      appBar: new AppBar(
        title: Image.asset('assets/door2door-car-wash.png'),
      ),
    );
  }
}
