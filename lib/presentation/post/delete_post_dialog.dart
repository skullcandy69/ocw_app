import 'package:flutter/material.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';

class DialogPost extends StatefulWidget {
  final Function onDeleting;
  final Post post;

  DialogPost(this.onDeleting, this.post);

  @override
  _DialogPostState createState() => _DialogPostState();
}

class _DialogPostState extends State<DialogPost> {
  bool isDeleting = false;

  @override
  void initState() {
    super.initState();
    broadcasterService.on(BroadcasterEventType.onDeletingPost).listen((data) {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Are you sure you want to delete this booking'),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text(
                'No',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: isDeleting
                  ? CircularProgressIndicator()
                  : Text(
                      'Yes',
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
              onPressed: () {
                setState(() {
                  isDeleting = true;
                  widget.onDeleting(widget.post);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
