import 'package:flutter/material.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:toast/toast.dart';

class RequestMoneyDialog extends StatefulWidget {
  final Function onRequestMoney;

  RequestMoneyDialog(this.onRequestMoney);

  @override
  _RequestMoneyDialogState createState() => _RequestMoneyDialogState();
}

class _RequestMoneyDialogState extends State<RequestMoneyDialog> {
  bool isRequesting = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    broadcasterService
        .on(BroadcasterEventType.onRequestingMoney)
        .listen((data) {
      if (mounted) {
        Toast.show('YOUR REQUEST HAS BEEN SEND', context, duration: 2);
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Center(child: Text('REQUEST MONEY')),
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          child: new TextFormField(
            controller: textEditingController,
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Required';
              }
              return null;
            },
            decoration: new InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: "AMOUNT",
                hintText: "0",

                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                )),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FlatButton(
            onPressed: () {
              setState(() {
                isRequesting = true;
              });
              widget.onRequestMoney(textEditingController.text.toString());
            },
            child: isRequesting
                ? CircularProgressIndicator()
                : Text('REQUSET MONEY'),
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
