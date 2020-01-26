import 'package:flutter/material.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';

class PinType extends StatefulWidget {
  final Function createRequest;
  final User user;

  PinType(this.createRequest, this.user);

  @override
  _PinTypeState createState() => _PinTypeState();
}

class _PinTypeState extends State<PinType> {
  List<String> pins = [];
  bool isUserTypeChanging = false;
  String pin = '';
GlobalKey<FormState>key = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    broadcasterService.on(BroadcasterEventType.onUpdateUserType).listen((data) {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Do you want to add pin location??"),
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 50, left: 40),
          decoration: BoxDecoration(shape: BoxShape.rectangle),
          child: TextFormField(
            key: key,
            controller: textEditingController,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            keyboardType: TextInputType.phone,
            onChanged: (String data) {
              setState(() {
                pin = data.trim();
              });
            },
            decoration: InputDecoration(
              hasFloatingPlaceholder: true,
              hintText: 'Pin (if any)',
              suffixIcon: textEditingController.text.isEmpty
                  ? Container()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          pins.add(textEditingController.text);
                          print(pins);
                          textEditingController.clear();
                        });
                      },
                      child: Icon(Icons.add)),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.all(5.0),
              ),
              color: Colors.red,
              padding: EdgeInsets.all(10),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  isUserTypeChanging=true;
                });
                widget.createRequest(parentId: pins.toString());
              },
              child: Container(
                child: isUserTypeChanging
                    ? CircularProgressIndicator()
                    : Text(
                        "Request",
                        style: TextStyle(color: Colors.white),
                      ),
                padding: EdgeInsets.all(5.0),
              ),
              color: Colors.green,
              padding: EdgeInsets.all(10),
            ),
          ],
        )
      ],
    );
  }
}
