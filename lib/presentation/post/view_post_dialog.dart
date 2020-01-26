import 'package:flutter/material.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';

class ViewPostDialog extends StatefulWidget {
  final Post post;
  final Function onOpeningPost;

  ViewPostDialog({this.post, this.onOpeningPost});

  @override
  _ViewPostDialogState createState() => _ViewPostDialogState();
}

class _ViewPostDialogState extends State<ViewPostDialog> {
  bool isViewing = false;

  @override
  void initState() {
    super.initState();
    broadcasterService.on(BroadcasterEventType.onViewingPost).listen((data) {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Are Sure You Want to View This Post?'),
      children: <Widget>[
        Container(
          child: Text(
              'An amount of ${widget.post.viewAmount} would be deducted from your wallet'),
          padding: EdgeInsets.all(15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Theme.of(context).errorColor),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  isViewing = true;
                  widget.onOpeningPost(widget.post);
                });
              },
              child: isViewing
                  ? CircularProgressIndicator()
                  : Text(
                      'Yes',
                      style: TextStyle(color: Colors.blue),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
