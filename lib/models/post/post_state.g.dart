// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostState extends PostState {
  @override
  final BuiltMap<String, Post> posts;
  @override
  final bool hasMore;
  @override
  final bool isLoading;
  @override
  final bool isFetching;
  @override
  final BuiltMap<String, bool> isViewed;
  @override
  final bool isBooking;

  factory _$PostState([void Function(PostStateBuilder) updates]) =>
      (new PostStateBuilder()..update(updates)).build();

  _$PostState._(
      {this.posts,
      this.hasMore,
      this.isLoading,
      this.isFetching,
      this.isViewed,
      this.isBooking})
      : super._();

  @override
  PostState rebuild(void Function(PostStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostStateBuilder toBuilder() => new PostStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostState &&
        posts == other.posts &&
        hasMore == other.hasMore &&
        isLoading == other.isLoading &&
        isFetching == other.isFetching &&
        isViewed == other.isViewed &&
        isBooking == other.isBooking;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, posts.hashCode), hasMore.hashCode),
                    isLoading.hashCode),
                isFetching.hashCode),
            isViewed.hashCode),
        isBooking.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostState')
          ..add('posts', posts)
          ..add('hasMore', hasMore)
          ..add('isLoading', isLoading)
          ..add('isFetching', isFetching)
          ..add('isViewed', isViewed)
          ..add('isBooking', isBooking))
        .toString();
  }
}

class PostStateBuilder implements Builder<PostState, PostStateBuilder> {
  _$PostState _$v;

  MapBuilder<String, Post> _posts;
  MapBuilder<String, Post> get posts =>
      _$this._posts ??= new MapBuilder<String, Post>();
  set posts(MapBuilder<String, Post> posts) => _$this._posts = posts;

  bool _hasMore;
  bool get hasMore => _$this._hasMore;
  set hasMore(bool hasMore) => _$this._hasMore = hasMore;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _isFetching;
  bool get isFetching => _$this._isFetching;
  set isFetching(bool isFetching) => _$this._isFetching = isFetching;

  MapBuilder<String, bool> _isViewed;
  MapBuilder<String, bool> get isViewed =>
      _$this._isViewed ??= new MapBuilder<String, bool>();
  set isViewed(MapBuilder<String, bool> isViewed) =>
      _$this._isViewed = isViewed;

  bool _isBooking;
  bool get isBooking => _$this._isBooking;
  set isBooking(bool isBooking) => _$this._isBooking = isBooking;

  PostStateBuilder();

  PostStateBuilder get _$this {
    if (_$v != null) {
      _posts = _$v.posts?.toBuilder();
      _hasMore = _$v.hasMore;
      _isLoading = _$v.isLoading;
      _isFetching = _$v.isFetching;
      _isViewed = _$v.isViewed?.toBuilder();
      _isBooking = _$v.isBooking;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostState;
  }

  @override
  void update(void Function(PostStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostState build() {
    _$PostState _$result;
    try {
      _$result = _$v ??
          new _$PostState._(
              posts: _posts?.build(),
              hasMore: hasMore,
              isLoading: isLoading,
              isFetching: isFetching,
              isViewed: _isViewed?.build(),
              isBooking: isBooking);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'posts';
        _posts?.build();

        _$failedField = 'isViewed';
        _isViewed?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
