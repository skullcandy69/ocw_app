import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:ocw_app/models/request/request.dart';

part 'request_state.g.dart';

abstract class RequestState
    implements Built<RequestState, RequestStateBuilder> {
  @nullable
  BuiltMap<String, Request> get requests;

  @nullable
  bool get isLoading;

  RequestState._();

  factory RequestState() {
    return _$RequestState((b) {
      b..requests = BuiltMap<String, Request>().toBuilder();
    });
  }
}
