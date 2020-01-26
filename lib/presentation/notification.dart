import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/pullrefresh/src/smart_refresher.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/presentation/post/post_view.dart';
import 'package:ocw_app/utils/size_config.dart';

class NotificationPage extends StatefulWidget {
  final List<Post> posts;
  final Function onOpeningPost;
  final User profile;
  final Function deletePost;
  final Function onEditPost;
  final Function onFetch;
  final bool isRefreshing;
  final bool hasMore;
  final Map<String, bool> isViewed;
  final Function onAccepting;
  final Function onReport;
  final Function onRefresh;

  NotificationPage({
    this.posts,
    this.onOpeningPost,
    this.deletePost,
    this.profile,
    this.onFetch,
    this.onEditPost,
    this.isRefreshing,
    this.hasMore,
    this.isViewed,
    this.onAccepting,
    this.onReport,
    this.onRefresh,
  });

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.all(20),
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: widget.posts.isEmpty
            ? Center(
                child: Text('No Booking for the moment'),
              )
            : ListView.separated(
                itemBuilder: ((BuildContext context, int index) {
                  return PostView(
                    post: widget.posts[index],
                    onReport: widget.onReport,
                    deletePost: widget.deletePost,
                    profile: widget.profile,
                    onOpeningPost: widget.onOpeningPost,
                    onEditPost: widget.onEditPost,
                    onAccepting: widget.onAccepting,
                    isViewed:
                        widget.isViewed.containsKey(widget.posts[index].id)
                            ? widget.isViewed[widget.posts[index].id]
                            : false,
                  );
                }),
                separatorBuilder: ((BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(left: 50),
                    child: Divider(
                      color: Theme.of(context).accentColor,
                    ),
                  );
                }),
                itemCount: widget.posts.length,
              ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    if (widget.isRefreshing) {
      return null;
    } else {
      widget.onFetch();
    }
    await new Future.delayed(new Duration(seconds: 3));
    return null;
  }
}
