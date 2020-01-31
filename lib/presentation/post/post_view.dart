import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/models/vehicle/vehicle_category.dart';
import 'package:ocw_app/presentation/post/delete_post_dialog.dart';
import 'package:ocw_app/presentation/post/showReportSpam.dart';
import 'package:ocw_app/presentation/post/view_post_dialog.dart';
import 'package:ocw_app/service/broadcaster_service.dart';
import 'package:ocw_app/utils/globals.dart';
import 'package:ocw_app/utils/size_config.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:toast/toast.dart';

class PostView extends StatefulWidget {
  final Post post;
  final Function onOpeningPost;
  final User profile;
  final Function deletePost;
  final Function onEditPost;
  final bool isViewed;
  final Function onAccepting;
  final Function onReport;

  PostView({
    this.onOpeningPost,
    this.deletePost,
    this.profile,
    this.post,
    this.onEditPost,
    this.isViewed,
    this.onAccepting,
    this.onReport,
  });

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  Post post;
  bool isDeleting = false;
  bool isAccepting = false;

  @override
  void initState() {
    super.initState();
    post = widget.post;
    isDeleting = false;
    broadcasterService.on(BroadcasterEventType.onAccepting).listen((data) {
      setState(() {
        isAccepting = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 120),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(right: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: SizeConfig.screenWidth * 0.1,
                    child: Text(
                      timeago.format(DateTime.parse(
                              widget.post.createdAt == null
                                  ? DateTime.now().toString()
                                  : widget.post.createdAt)
                          .toLocal()),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 5.0,
                  ),
                  widget.isViewed || widget.profile.userType == UserType.admin
                      ? userDetails1()
                      : userDetails(),
                  Container(
                    child: Row(
                      children: <Widget>[
                        (widget.post.userId == widget.profile.id ||
                                widget.profile.userType == UserType.admin ||
                                widget.post.isAccepted)
                            ? Container()
                            : widget.isViewed
                                ? isAccepting
                                    ? CircularProgressIndicator()
                                    : RaisedButton(
                                        onPressed: () {
                                          setState(() {
                                            isAccepting = true;
                                          });
                                          widget.onAccepting(post);
                                        },
                                        child: Text('Accept'),
                                      )
                                : Container(
                                    child: FlatButton(
                                      onPressed: () {
                                        if (!widget.isViewed) {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ViewPostDialog(
                                                  post: widget.post,
                                                  onOpeningPost:
                                                      widget.onOpeningPost,
                                                );
                                              });
                                        } else {
                                          Toast.show(
                                              "This Post is Already Viewed",
                                              context);
                                        }
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        size: 28,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  ),
                        Spacer(
                          flex: 2,
                        ),
                        (widget.post.userId == widget.profile.id) ||
                                (widget.profile.userType == UserType.admin)
                            ? InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return DialogPost(
                                          widget.deletePost, widget.post);
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Theme.of(context).errorColor,
                                ),
                              )
                            : Container(),
                        Spacer(
                          flex: 8,
                        ),
                        (widget.post.userId == widget.profile.id) ||
                                (widget.profile.userType == UserType.admin)
                            ? InkWell(
                                onTap: () {
                                  _showDialog(context);
                                },
                                child: Icon(
                                  Icons.error,
                                  size: 28,
                                  color: Color.fromRGBO(192, 23, 89, 1),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

//            Text(widget.post.rate),
//            !((widget.profile.id == widget.post.userId) ||
//                    (widget.profile.userType == UserType.admin))
//                ? Container()
//                : InkWell(
//                    onTap: () {
//                      showDialog(
//                          context: context,
//                          builder: (BuildContext context) {
//                            return EditPostDialog(
//                                widget.onEditPost, widget.post);
//                          });
//                    },
//                    child: Container(
//                      child: Icon(
//                        Icons.mode_edit,
//                        size: 17,
//                      ),
//                    ),
//                  ),
          ],
        ),
      ),
    );
  }

  Widget userDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.post.name,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              widget.post.rate + ' ' + '%',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
//            Icon(
//              Icons.star,
//              color: Colors.red,
//              size: 15,
//            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              'Date : ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat('yyyy-MM-dd')
                  .parse(widget.post.date)
                  .toString()
                  .split(' ')[0],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 13.0),
            ),
          ],
        ),
        widget.post.vehicleCategory == VehicleCategory.bike
            ? Container()
            : Row(
                children: <Widget>[
                  Text(
                    'Vehicle-Type : ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.post.vehicleType.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 13.0),
                  ),
                ],
              ),
        Row(
          children: <Widget>[
            Text(
              'Vehicle Category : ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.post.vehicleCategory.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 13.0),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Text(
              'View Amount: ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.post.viewAmount.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 13.0),
            ),
          ],
        ),
      ],
    );
  }

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowReportSpam(
          onReport: widget.onReport,
          post: widget.post,
        );
      },
    );
  }

  Widget userDetails1() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Name : ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.post.name.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 17.0),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Text(
              'Vehicle-Type : ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.post.vehicleType.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 13.0),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Text(
              'Vehicle Category : ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.post.vehicleCategory.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 13.0),
            ),
          ],
        ),
        SizedBox(height: 5),
        InkWell(
          child: Row(
            children: <Widget>[
              Text(
                'Mobile : ',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.post.mobileNo.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.blue, fontSize: 15.0),
              ),
            ],
          ),
          onTap: () => callService.call(widget.post.mobileNo),
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Text(
              'Address: ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: Text(
                  widget.post.location.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 13.0),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
//        if (widget.post.vehicleNo != null)
//          (Row(
//            children: <Widget>[
//              Text(
//                'Vehicle Number : ',
//                maxLines: 1,
//                overflow: TextOverflow.ellipsis,
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 13.0,
//                    fontWeight: FontWeight.bold),
//              ),
//              Text(
//                widget.post.vehicleNo.toString(),
//                maxLines: 1,
//                overflow: TextOverflow.ellipsis,
//                style: TextStyle(color: Colors.grey, fontSize: 13.0),
//              ),
//            ],
//          )),
        Row(
          children: <Widget>[
            Text(
              'Date: ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat.yMMMMd().format(DateTime.parse(widget.post.date)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 13.0),
            ),
            Divider()
          ],
        ),
      ],
    );
  }
}
