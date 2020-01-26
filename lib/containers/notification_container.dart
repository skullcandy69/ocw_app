import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocw_app/actions/post_action.dart';
import 'package:ocw_app/actions/user_action.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/presentation/notification.dart';
import 'package:redux/redux.dart';

class NotificationContainer extends StatelessWidget {
  static const String routeNamed = 'Home Page';
  final bool isAll;

  NotificationContainer(this.isAll);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return NotificationPage(
            onReport: _viewModel.onReport,
            posts: isAll ? _viewModel.allPosts : _viewModel.myPosts,
            deletePost: _viewModel.onDeletePost,
            profile: _viewModel.user,
            onOpeningPost: _viewModel.onView,
            onEditPost: _viewModel.onEditPost,
            onFetch:
                isAll ? _viewModel.onAllPostFetch : _viewModel.onMyPostFetch,
            isRefreshing: _viewModel.isFetching,
            isViewed: _viewModel.postViewed,
            onAccepting: _viewModel.onAccepting,
            hasMore: _viewModel.hasMore);
      },
    );
  }
}

class _ViewModel {
  final List<Post> myPosts;
  final List<Post> allPosts;
  final User user;
  final Function onView;
  final Function onDeletePost;
  final Function onEditPost;
  final Function onAllPostFetch;
  final Function onMyPostFetch;
  final bool hasMore;
  final bool isFetching;
  final Map<String, bool> postViewed;
  final Function onAccepting;
  final Function onReport;
  final Function onRefresh;

  _ViewModel({
    this.myPosts,
    this.allPosts,
    this.user,
    this.onView,
    this.onDeletePost,
    this.onEditPost,
    this.onAllPostFetch,
    this.onMyPostFetch,
    this.hasMore,
    this.isFetching,
    this.onAccepting,
    this.postViewed,
    this.onReport,
    this.onRefresh,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    print('Map in notification store ${store.state.post.isViewed.toMap()}');
    return _ViewModel(
        onRefresh: () {
          store.dispatch(OnRefreshWallet());
        },
        onEditPost: (Post post) {
          store.dispatch(EditPost(post));
        },
        onReport: (Post post) {
          store.dispatch(ReportPost(post));
        },
        onAllPostFetch: () {
          store.dispatch(FetchMore(true));
        },
        onAccepting: (Post post) {
          Post _post = post.rebuild((b) {
            b..status = '1';
            b..acceptedBy = store.state.user.profile.id;
          });
          store.dispatch(AcceptPost(_post));
        },
        onMyPostFetch: () {
          store.dispatch(false);
        },
        isFetching: store.state.post.isFetching,
        hasMore: store.state.post.hasMore,
        myPosts: store.state.my.toList(),
        allPosts: store.state.all.toList(),
        user: store.state.user.profile,
        onView: (Post post) {
          store.dispatch(ViewPost(post));
        },
        postViewed: store.state.post.isViewed.toMap(),
        onDeletePost: (Post post) {
          store.dispatch(DeletePost(post));
        });
  }
}
