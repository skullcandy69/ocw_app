import 'package:flutter/material.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';

class SendMoneyDialog extends StatefulWidget {
  final Function onSendMoney;
  final User user;

  SendMoneyDialog(this.onSendMoney, this.user);

  @override
  _SendMoneyDialogState createState() => _SendMoneyDialogState();
}

class _SendMoneyDialogState extends State<SendMoneyDialog> {
  final _formKey = GlobalKey<FormState>();
  String amount;
  String id;
  TextEditingController textEditingController = TextEditingController();

  bool isSending = false;

  @override
  void initState() {
    super.initState();
    broadcasterService.on(BroadcasterEventType.onSendingMoney).listen((data) {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(child: Text('SEND MONEY')),
        children: <Widget>[
//          Divider(),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: new TextFormField(
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Required';
                }
                return null;
              },
              decoration: new InputDecoration(
                  icon: Icon(Icons.perm_identity),
                  hasFloatingPlaceholder: true,
                  labelText: "ID",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 4.0),
                  )),
              onSaved: (String data) {
                id = data.trim();
              },
              keyboardType: TextInputType.number,
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: new TextFormField(
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Required';
                } else if (int.parse(widget.user.amount) < 500) {
                  return 'Wallet balance should be min 500';
                } else if (int.parse(value.trim()) >
                    int.parse(widget.user.amount)) {
                  return "Insufficient Balance";
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
              onSaved: (String value) {
                amount = value;
              },
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
            child: FlatButton(
              onPressed: () {
                _formKey.currentState.save();
                if (_formKey.currentState.validate()) {
                  setState(() {
                    isSending = true;
                  });

                  widget.onSendMoney(id, amount);
                }
              },
              child: Container(
                  child: isSending
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        )
                      : Text('CONFIRM')),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
