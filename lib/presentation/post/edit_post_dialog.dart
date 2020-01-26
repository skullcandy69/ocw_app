import 'package:flutter/material.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';

class EditPostDialog extends StatefulWidget {
  final Function onEditPost;
  final Post post;

  EditPostDialog(this.onEditPost, this.post);

  @override
  _EditPostDialogState createState() => _EditPostDialogState();
}

class _EditPostDialogState extends State<EditPostDialog> {
  bool isEditingPost = false;
  Post post;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    broadcasterService.on(BroadcasterEventType.onEditingPost).listen((data) {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Edit the Details of the Booking?'),
      children: <Widget>[
        Form(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                    width: 2,
                    color: Colors.green,
                  ),
                ),
                child: TextFormField(
                  controller: textEditingController,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'amount required  is required'; //StringUtil.AGE_REQUIRED_TEXT;
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'View-Amount',
                    hintStyle: TextStyle(
                      fontSize: 18,
//                      color: Colors.green,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(7),
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
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (textEditingController.text.trim().isEmpty) {
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          isEditingPost = true;
                          widget.onEditPost(widget.post.rebuild((b) => b
                            ..viewAmount = textEditingController.text.trim()));
                        });
                      }
                    },
                    child: isEditingPost
                        ? CircularProgressIndicator()
                        : Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
