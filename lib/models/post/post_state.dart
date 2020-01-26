import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:ocw_app/models/post/post.dart';

part 'post_state.g.dart';

abstract class PostState implements Built<PostState, PostStateBuilder> {
  @nullable
  BuiltMap<String, Post> get posts;

  @nullable
  bool get hasMore;

  @nullable
  bool get isLoading;

  @nullable
  bool get isFetching;

  @nullable
  BuiltMap<String, bool> get isViewed;

  @nullable
  bool get isBooking;

  PostState._();

  factory PostState() {
    return _$PostState((b) {
      b..posts = BuiltMap<String, Post>().toBuilder();
      b..hasMore = true;
      b..isFetching = false;
      b..isLoading = false;
      b..isViewed = BuiltMap<String, bool>().toBuilder();
      b..isBooking = false;
    });
  }
}
