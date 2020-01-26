import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/user/user_type.dart';

class CreatePost {
  Post post;
  UserType userType;

  CreatePost(this.post, this.userType);
}

class DeletePost {
  Post post;

  DeletePost(this.post);
}

class ViewPost {
  Post post;

  ViewPost(this.post);
}

class CreatePostComplete {
  Post post;

  CreatePostComplete(this.post);
}

class ReportPost {
  Post post;

  ReportPost(this.post);
}

class EditPost {
  Post post;

  EditPost(this.post);
}

class FetchPosts {
  List<Post> posts;

  FetchPosts(this.posts);
}

class GetViewedPost {
  List<dynamic> list;

  GetViewedPost(this.list);
}

class FetchMore {
  bool all;

  FetchMore(this.all);
}

class FetchMoreComplete {}

class RefreshPost {}

class RefreshPostComplete {}

class AcceptPost {
  final Post post;

  AcceptPost(this.post);
}
