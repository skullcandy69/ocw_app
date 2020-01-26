import 'package:flutter/material.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:toast/toast.dart';

class ShowReportSpam extends StatefulWidget {
  final Function onReport;
  final Post post;

  ShowReportSpam({this.onReport, this.post});

  @override
  _ShowReportSpamState createState() => _ShowReportSpamState();
}

class _ShowReportSpamState extends State<ShowReportSpam> {
  final _formKey = GlobalKey<FormState>();
  String description = '';

  bool isReporting = false;

  @override
  void initState() {
    super.initState();
    broadcasterService.on(BroadcasterEventType.onReportingPost).listen((data) {
      Navigator.pop(context);
    });
    broadcasterService.on(BroadcasterEventType.onError).listen((data) {
      if (mounted) {
        setState(() {
          isReporting = false;
        });
        Toast.show('Unhandle Exception', context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SimpleDialog(
        titlePadding: EdgeInsets.only(left: 20.0, right: 10.0),
        contentPadding: EdgeInsets.all(20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Do you want to Report this post?'),
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5.0)),
            child: TextFormField(
              maxLines: null,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '',
                //   errorText: _getErrorMessage(networkError, 'caption'),
              ),
              maxLength: 100,
              onSaved: (String value) {
                setState(() {
                  description = value;
                });
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Required';
                }
                return null;
              },
              onEditingComplete: () {},
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: isReporting
                    ? CircularProgressIndicator()
                    : Text(
                        'Report',
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                onPressed: () {
                  _formKey.currentState.save();
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      isReporting = true;
                    });
                    widget.onReport(widget.post);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
