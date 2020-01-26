import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDialog extends StatefulWidget {
  final String title, desc, pbt;

  BookDialog({
    @required this.title,
    @required this.desc,
    @required this.pbt,
  });

  static const double padding = 20;

  @override
  _BookDialogState createState() => _BookDialogState();
}

class _BookDialogState extends State<BookDialog> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      if (widget.title == 'Platinum 10% off') {
                        showBottomSheet(
                            context: context,
                            builder: (BuildContext context) => BookDialog(
                                  title: "Gold 10% off",
                                  desc: 'xyz',
                                  pbt: "Book your service",
                                ));
                      } else if (widget.title == 'Silver 10% off') {
                        showBottomSheet(
                            context: context,
                            builder: (BuildContext context) => BookDialog(
                                  title: "Platinum 10% off",
                                  desc: 'xyz',
                                  pbt: "Book your service",
                                ));
                      } else if (widget.title == 'Gold 10% off') {
                        showBottomSheet(
                            context: context,
                            builder: (BuildContext context) => BookDialog(
                                  title: "Silver 10% off",
                                  desc: 'xyz',
                                  pbt: "Book your service",
                                ));
                      }
                    }),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
                InkWell(
                  child: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    if (widget.title == 'Platinum 10% off') {
                      showBottomSheet(
                          context: context,
                          builder: (BuildContext context) => BookDialog(
                                title: "Silver 10% off",
                                desc: 'xyz',
                                pbt: "Book your service",
                              ));
                    } else if (widget.title == 'Silver 10% off') {
                      showBottomSheet(
                          context: context,
                          builder: (BuildContext context) => BookDialog(
                                title: "Gold 10% off",
                                desc: 'xyz',
                                pbt: "Book your service",
                              ));
                    } else if (widget.title == 'Gold 10% off') {
                      showBottomSheet(
                          context: context,
                          builder: (BuildContext context) => BookDialog(
                                title: "Platinum 10% off",
                                desc: 'xyz',
                                pbt: "Book your service",
                              ));
                    }
                  },
                )
              ],
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Small',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                        fontSize: 18),
                  ),
                  Text(
                    'Rs 450/-',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Medium',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                        fontSize: 18),
                  ),
                  Text(
                    'Rs 495/-',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Large',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                        fontSize: 18),
                  ),
                  Text(
                    'Rs 540/-',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),

          Divider(),
          Row(
            children: <Widget>[
              Text(
                'Dry Steam Wash @150/-, 165/-, 180/-',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),

          SizedBox(height: 10),
          Divider(),

          InkWell(
              child: Row(
            children: <Widget>[
              Text(
                'Wet Steam Wash @200/-, 220/-, 240/-',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          )),
          SizedBox(height: 10),
          Divider(),
          InkWell(
              child: Row(
            children: <Widget>[
              Text(
                'Vacuum Cleaning @100/-, 110/-, 120/-',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          )),
          SizedBox(height: 10),
          Divider(),
          InkWell(
              child: Row(
            children: <Widget>[
              Text(
                'Polish (Dashboard & tyre) @50/-, 55/-, 60/-',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          )),

          widget.title == 'Gold 10% off' || widget.title == 'Platinum 10% off'
              ? InkWell(
                  child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          'Dry Cleaning @100/-, 110/-, 120/-',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ))
              : Container(),
          widget.title == 'Platinum 10% off'
              ? InkWell(
                  child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          'Rubbing-Polish @100/-, 110/-, 120/-',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ))
              : Container(),
          Divider(),
          InkWell(
              child: Row(
            children: <Widget>[
              Text(
                '*Notes Applied',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          )),

        ],
      ),
    );
  }
}
