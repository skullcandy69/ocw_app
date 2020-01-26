
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/request/request.dart';

class FetchRequest {
  final List<Request> requests;

  FetchRequest(this.requests);
}

class FetchRequestComplete {
  final List<Request> requests;

  FetchRequestComplete(this.requests);
}

class PerformAction {
  final Request request;

  PerformAction(this.request);
}

class CreateRequest {
  final Request request;
  final String parentId;

  CreateRequest({this.request, this.parentId});
}

class CreateRequestComplete {
  final Request request;

  CreateRequestComplete(this.request);
}

class ReportRequest {
  Post post;

  ReportRequest(this.post);
}
