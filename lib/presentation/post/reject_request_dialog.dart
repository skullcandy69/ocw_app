import 'package:flutter/material.dart';
import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';

class RejectRequest extends StatefulWidget {
  final Request request;
  final Function onActionPerform;

  RejectRequest(this.request, this.onActionPerform);

  @override
  _RejectRequestState createState() => _RejectRequestState();
}

class _RejectRequestState extends State<RejectRequest> {
  bool isRejecting = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    broadcasterService.on(BroadcasterEventType.onRejecting).listen((data) {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Reason"),
          InkWell(
            child: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Skip'),
              color: Colors.white,
              textColor: Colors.black,
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  isRejecting = true;
                });
                Request _request;
                _request = widget.request.rebuild((b) {
                  b..status = TransactionStatus.failure;
                  b..reason = textEditingController.text;
                });
                widget.onActionPerform(_request);
              },
              child:
                  isRejecting ? CircularProgressIndicator() : Icon(Icons.send),
              color: Colors.white,
              textColor: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}
