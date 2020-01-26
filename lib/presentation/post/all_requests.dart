import 'package:ocw_app/models/request/request.dart';
import 'package:ocw_app/models/request/request_type.dart';
import 'package:ocw_app/models/transaction/transaction_status.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/presentation/post/button.dart';
import 'package:ocw_app/presentation/post/reject_request_dialog.dart';
import 'package:ocw_app/utils/size_config.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllRequests extends StatefulWidget {
  final List<Request> requests;
  final Function onActionPerform;
  final Function onRefresh;

  AllRequests(this.requests, this.onRefresh, this.onActionPerform);

  @override
  _AllRequestsState createState() => _AllRequestsState();
}

class _AllRequestsState extends State<AllRequests> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView.separated(
            itemCount: widget.requests.length,
            itemBuilder: (BuildContext context, int index) {
              return requests(widget.requests[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.only(left: 50),
                child: Divider(
                  color: Theme.of(context).accentColor,
                ),
              );
            },
          )),
    );
  }

  Widget requests(Request request) {
    return Container(
      constraints: BoxConstraints(minHeight: 120),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(right: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: SizeConfig.screenWidth * 0.1,
                    child: Text(timeago.format(DateTime.parse(
                            request.timestamp == null
                                ? DateTime.now().toString()
                                : request.timestamp)
                        .toLocal())),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      RequestType.displayValueOf(request.request),
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'From : ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          request.userName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          request.request == RequestType.pin
                              ? 'Pin'
                              : request.request == RequestType.report
                                  ? 'Post Id : '
                                  : 'User Id : ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          request.request == RequestType.pin
                              ? request.parentId
                              : request.request == RequestType.report
                                  ? request.postId
                                  : request.userId,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          request.request == RequestType.report
                              ? 'Description : '
                              : request.request == RequestType.money
                                  ? 'Amount  : '
                                  : 'Requested for  : ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          request.request == RequestType.report
                              ? request.description
                              : request.request == RequestType.money
                                  ? request.amount
                                  : UserType.displayValueOf(request.userType),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        ),
                      ],
                    ),
                    !(request.status == TransactionStatus.success ||
                            request.status == TransactionStatus.failure)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return RejectRequest(
                                            request, widget.onActionPerform);
                                      });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                      request.request == RequestType.money
                                          ? 'Reject'
                                          : 'Cancel'),
                                ),
                                color: Colors.red,
                                textColor: Colors.white,
                              ),
                              Button(request, widget.onActionPerform),
                            ],
                          )
                        : Row(
                            children: <Widget>[
                              Text(
                                'Status : ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                request.status.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 15.0),
                              ),
                            ],
                          ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    widget.onRefresh();
    await new Future.delayed(new Duration(seconds: 3));
    return null;
  }
}
