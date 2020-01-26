import 'package:flutter/material.dart';

class LogoutDialog extends StatefulWidget {
  final Function logout;

  LogoutDialog(this.logout);

  @override
  _LogoutDialogState createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  bool isLoggingOut = false;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        Container(
          child: Text(
            'Are you sure you want to logout?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
        ),
        Container(
          child: Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'),
              ),
              FlatButton(
                child: isLoggingOut ? CircularProgressIndicator() : Text('Yes'),
                onPressed: () {
                  setState(() {
                    isLoggingOut = true;
                  });
                  widget.logout();
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          padding: EdgeInsets.all(10.0),
        ),
      ],
    );
  }
}
