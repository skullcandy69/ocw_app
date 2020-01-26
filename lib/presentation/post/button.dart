import 'package:flutter/material.dart';
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/request/request_type.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';

class Button extends StatefulWidget {
  final Request request;
  final Function onActionPerform;

  Button(this.request, this.onActionPerform);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isSending = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    broadcasterService.on(BroadcasterEventType.onSendingMoney).listen((data) {
      if (mounted) {
        setState(() {
          isSending = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          isSending = true;
        });
        Request _request;
        if (widget.request.request == RequestType.money) {
          _request = widget.request.rebuild((b) {
            b..status = TransactionStatus.success;
          });
        } else {
          _request = widget.request.rebuild((b) {
            b..status = TransactionStatus.success;
          });
        }
        widget.onActionPerform(_request);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: isSending
            ? CircularProgressIndicator()
            : Text(widget.request.request == RequestType.money
                ? 'Send'
                : 'Accept'),
      ),
      color: Colors.green,
      textColor: Colors.white,
    );
  }
}
