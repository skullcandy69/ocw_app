import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';

class UpgradeType extends StatefulWidget {
  final Function createRequest;
  final User user;

  UpgradeType(this.createRequest, this.user);

  @override
  _UpgradeTypeState createState() => _UpgradeTypeState();
}

class _UpgradeTypeState extends State<UpgradeType> {
  String referenceId = '';
  UserType _picked;
  UserType ch;
  bool isUserTypeChanging = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _picked = widget.user.userType == UserType.client
        ? UserType.freelancer
        : widget.user.userType == UserType.freelancer
            ? UserType.franchise
            : UserType.freelancer;
    if (_picked == UserType.freelancer) {
      ch = UserType.franchise;
    } else {
      ch = UserType.freelancer;
    }

    broadcasterService.on(BroadcasterEventType.onUpdateUserType).listen((data) {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Do you want to upgrade?"),
      children: <Widget>[
        RadioButtonGroup(
          orientation: GroupedButtonsOrientation.HORIZONTAL,
          margin: const EdgeInsets.only(left: 12.0),
          onSelected: (String selected) => setState(() {
            if (selected == UserType.freelancer.toString()) {
              _picked = UserType.freelancer;
            } else {
              _picked = UserType.franchise;
            }
          }),
          labels: <String>[
            UserType.freelancer.toString(),
            UserType.franchise.toString(),
          ],
          picked: _picked.toString(),
          itemBuilder: (Radio rb, Text txt, int i) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                rb,
                txt,
              ],
            );
          },
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black)),
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            keyboardType: TextInputType.phone,
            onChanged: (String data) {
              referenceId = data.trim();
            },
            decoration: InputDecoration(
                hasFloatingPlaceholder: true,
                border: InputBorder.none,
                hintText: 'Reference ID(if any)'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
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
                  isUserTypeChanging = true;
                });
                if (referenceId.isNotEmpty) {
                  widget.createRequest(
                      userType: _picked, parentId: referenceId);
                } else {
                  widget.createRequest(userType: _picked);
                }
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
