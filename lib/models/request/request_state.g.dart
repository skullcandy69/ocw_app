// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RequestState extends RequestState {
  @override
  final BuiltMap<String, Request> requests;
  @override
  final bool isLoading;

  factory _$RequestState([void Function(RequestStateBuilder) updates]) =>
      (new RequestStateBuilder()..update(updates)).build();

  _$RequestState._({this.requests, this.isLoading}) : super._();

  @override
  RequestState rebuild(void Function(RequestStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestStateBuilder toBuilder() => new RequestStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestState &&
        requests == other.requests &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, requests.hashCode), isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RequestState')
          ..add('requests', requests)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class RequestStateBuilder
    implements Builder<RequestState, RequestStateBuilder> {
  _$RequestState _$v;

  MapBuilder<String, Request> _requests;
  MapBuilder<String, Request> get requests =>
      _$this._requests ??= new MapBuilder<String, Request>();
  set requests(MapBuilder<String, Request> requests) =>
      _$this._requests = requests;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  RequestStateBuilder();

  RequestStateBuilder get _$this {
    if (_$v != null) {
      _requests = _$v.requests?.toBuilder();
      _isLoading = _$v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequestState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RequestState;
  }

  @override
  void update(void Function(RequestStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RequestState build() {
    _$RequestState _$result;
    try {
      _$result = _$v ??
          new _$RequestState._(
              requests: _requests?.build(), isLoading: isLoading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'requests';
        _requests?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RequestState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
