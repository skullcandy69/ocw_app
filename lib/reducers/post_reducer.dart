import 'package:ocw_app/actions/post_action.dart';
import 'package:ocw_app/actions/user_action.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/post/post_state.dart';
import 'package:redux/redux.dart';

import 'package:built_collection/built_collection.dart';

Reducer<PostState> postReducer = combineReducers([
  TypedReducer<PostState, CreatePostComplete>(createPostCompleteReducer),
  TypedReducer<PostState, CreatePost>(createPostReducer),
  TypedReducer<PostState, FetchPosts>(fetchPostReducer),
  TypedReducer<PostState, DeletePost>(deletePostReducer),
  TypedReducer<PostState, ViewPost>(viewPostReducer),
  TypedReducer<PostState, GetViewedPost>(getViewedPostReducer),
  TypedReducer<PostState, EditPost>(editPostReducer),
  TypedReducer<PostState, FetchMore>(fetchMorePostReducer),
  TypedReducer<PostState, FetchMoreComplete>(fetchMoreCompletePostReducer),
  TypedReducer<PostState, AcceptPost>(acceptPostReducer),
  TypedReducer<PostState, Logout>(logoutPostReducer),
]);

PostState createPostCompleteReducer(
    PostState state, CreatePostComplete action) {
  state = state.rebuild((b) {
    b..posts.addAll({action.post.id: action.post});
    b..isBooking = false;
  });
  return state;
}

PostState fetchPostReducer(PostState state, FetchPosts action) {
  if (action.posts.length > state.posts.length) {
    Map<String, Post> map = action.posts.fold(
        {},
        (Map<String, Post> objectsMap, Post post) =>
            objectsMap..addAll({post.id: post}));

    print('map is $map');

    return state.rebuild((b) {
      b..posts = BuiltMap.of(map).toBuilder();
    });
  } else {
    return state.rebuild((b) => b..hasMore = false);
  }
}

PostState createPostReducer(PostState state, CreatePost action) {
  return state.rebuild((b) => b..isBooking = true);
}

PostState deletePostReducer(PostState state, DeletePost action) {
  return state.rebuild((b) {
    b..posts.remove(action.post);
  });
}

PostState viewPostReducer(PostState state, ViewPost action) {
  return state.rebuild((b) => b..isViewed.addAll({action.post.id: true}));
}

PostState editPostReducer(PostState state, EditPost action) {
  return state.rebuild((b) => b..posts.addAll({action.post.id: action.post}));
}

PostState getViewedPostReducer(PostState state, GetViewedPost action) {
  Map<String, bool> map = action.list.fold(
      {},
      (Map<String, bool> objectsMap, dynamic post) =>
          objectsMap..addAll({post.toString(): true}));

  return state.rebuild((b) => b..isViewed = BuiltMap.of(map).toBuilder());
}

PostState fetchMorePostReducer(PostState state, FetchMore action) {
  return state.rebuild((b) => b..isFetching = true);
}

PostState fetchMoreCompletePostReducer(
    PostState state, FetchMoreComplete action) {
  return state.rebuild((b) => b..isFetching = false);
}

PostState acceptPostReducer(PostState state, AcceptPost action) {
  return state.rebuild((b) {
    b..posts.addAll({action.post.id: action.post});
  });
}

PostState logoutPostReducer(PostState state, Logout action) {
  return PostState();
}
