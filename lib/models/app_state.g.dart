// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();
Serializer<UserState> _$userStateSerializer = new _$UserStateSerializer();
Serializer<PriceTagState> _$priceTagStateSerializer =
    new _$PriceTagStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(UserState)),
      'isRefreshing',
      serializers.serialize(object.isRefreshing,
          specifiedType: const FullType(bool)),
      'post',
      serializers.serialize(object.post,
          specifiedType: const FullType(PostState)),
      'priceTag',
      serializers.serialize(object.priceTag,
          specifiedType: const FullType(PriceTagState)),
      'transaction',
      serializers.serialize(object.transaction,
          specifiedType: const FullType(TransactionState)),
      'request',
      serializers.serialize(object.request,
          specifiedType: const FullType(RequestState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserState)) as UserState);
          break;
        case 'isRefreshing':
          result.isRefreshing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'post':
          result.post.replace(serializers.deserialize(value,
              specifiedType: const FullType(PostState)) as PostState);
          break;
        case 'priceTag':
          result.priceTag.replace(serializers.deserialize(value,
              specifiedType: const FullType(PriceTagState)) as PriceTagState);
          break;
        case 'transaction':
          result.transaction.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TransactionState))
              as TransactionState);
          break;
        case 'request':
          result.request.replace(serializers.deserialize(value,
              specifiedType: const FullType(RequestState)) as RequestState);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStateSerializer implements StructuredSerializer<UserState> {
  @override
  final Iterable<Type> types = const [UserState, _$UserState];
  @override
  final String wireName = 'UserState';

  @override
  Iterable<Object> serialize(Serializers serializers, UserState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.isLoggedIn != null) {
      result
        ..add('isLoggedIn')
        ..add(serializers.serialize(object.isLoggedIn,
            specifiedType: const FullType(bool)));
    }
    if (object.isLoggingIn != null) {
      result
        ..add('isLoggingIn')
        ..add(serializers.serialize(object.isLoggingIn,
            specifiedType: const FullType(bool)));
    }
    if (object.profile != null) {
      result
        ..add('profile')
        ..add(serializers.serialize(object.profile,
            specifiedType: const FullType(User)));
    }
    if (object.userDetails != null) {
      result
        ..add('userDetails')
        ..add(serializers.serialize(object.userDetails,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(String)])));
    }
    return result;
  }

  @override
  UserState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isLoggedIn':
          result.isLoggedIn = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isLoggingIn':
          result.isLoggingIn = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'profile':
          result.profile.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
        case 'userDetails':
          result.userDetails.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(String)
              ])) as BuiltMap<dynamic, dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$PriceTagStateSerializer implements StructuredSerializer<PriceTagState> {
  @override
  final Iterable<Type> types = const [PriceTagState, _$PriceTagState];
  @override
  final String wireName = 'PriceTagState';

  @override
  Iterable<Object> serialize(Serializers serializers, PriceTagState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.priceTags != null) {
      result
        ..add('priceTags')
        ..add(serializers.serialize(object.priceTags,
            specifiedType: const FullType(BuiltMap, const [
              const FullType(VehicleType),
              const FullType(PriceTag)
            ])));
    }
    return result;
  }

  @override
  PriceTagState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PriceTagStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'priceTags':
          result.priceTags.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(VehicleType),
                const FullType(PriceTag)
              ])) as BuiltMap<dynamic, dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final bool isLoading;
  @override
  final UserState user;
  @override
  final bool isRefreshing;
  @override
  final PostState post;
  @override
  final PriceTagState priceTag;
  @override
  final TransactionState transaction;
  @override
  final RequestState request;
  List<Post> __all;
  List<Transaction> __getAllTransaction;
  List<Request> __getAllRequest;
  List<Post> __my;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.isLoading,
      this.user,
      this.isRefreshing,
      this.post,
      this.priceTag,
      this.transaction,
      this.request})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    }
    if (user == null) {
      throw new BuiltValueNullFieldError('AppState', 'user');
    }
    if (isRefreshing == null) {
      throw new BuiltValueNullFieldError('AppState', 'isRefreshing');
    }
    if (post == null) {
      throw new BuiltValueNullFieldError('AppState', 'post');
    }
    if (priceTag == null) {
      throw new BuiltValueNullFieldError('AppState', 'priceTag');
    }
    if (transaction == null) {
      throw new BuiltValueNullFieldError('AppState', 'transaction');
    }
    if (request == null) {
      throw new BuiltValueNullFieldError('AppState', 'request');
    }
  }

  @override
  List<Post> get all => __all ??= super.all;

  @override
  List<Transaction> get getAllTransaction =>
      __getAllTransaction ??= super.getAllTransaction;

  @override
  List<Request> get getAllRequest => __getAllRequest ??= super.getAllRequest;

  @override
  List<Post> get my => __my ??= super.my;

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        isLoading == other.isLoading &&
        user == other.user &&
        isRefreshing == other.isRefreshing &&
        post == other.post &&
        priceTag == other.priceTag &&
        transaction == other.transaction &&
        request == other.request;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, isLoading.hashCode), user.hashCode),
                        isRefreshing.hashCode),
                    post.hashCode),
                priceTag.hashCode),
            transaction.hashCode),
        request.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('isLoading', isLoading)
          ..add('user', user)
          ..add('isRefreshing', isRefreshing)
          ..add('post', post)
          ..add('priceTag', priceTag)
          ..add('transaction', transaction)
          ..add('request', request))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  UserStateBuilder _user;
  UserStateBuilder get user => _$this._user ??= new UserStateBuilder();
  set user(UserStateBuilder user) => _$this._user = user;

  bool _isRefreshing;
  bool get isRefreshing => _$this._isRefreshing;
  set isRefreshing(bool isRefreshing) => _$this._isRefreshing = isRefreshing;

  PostStateBuilder _post;
  PostStateBuilder get post => _$this._post ??= new PostStateBuilder();
  set post(PostStateBuilder post) => _$this._post = post;

  PriceTagStateBuilder _priceTag;
  PriceTagStateBuilder get priceTag =>
      _$this._priceTag ??= new PriceTagStateBuilder();
  set priceTag(PriceTagStateBuilder priceTag) => _$this._priceTag = priceTag;

  TransactionStateBuilder _transaction;
  TransactionStateBuilder get transaction =>
      _$this._transaction ??= new TransactionStateBuilder();
  set transaction(TransactionStateBuilder transaction) =>
      _$this._transaction = transaction;

  RequestStateBuilder _request;
  RequestStateBuilder get request =>
      _$this._request ??= new RequestStateBuilder();
  set request(RequestStateBuilder request) => _$this._request = request;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _user = _$v.user?.toBuilder();
      _isRefreshing = _$v.isRefreshing;
      _post = _$v.post?.toBuilder();
      _priceTag = _$v.priceTag?.toBuilder();
      _transaction = _$v.transaction?.toBuilder();
      _request = _$v.request?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              isLoading: isLoading,
              user: user.build(),
              isRefreshing: isRefreshing,
              post: post.build(),
              priceTag: priceTag.build(),
              transaction: transaction.build(),
              request: request.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();

        _$failedField = 'post';
        post.build();
        _$failedField = 'priceTag';
        priceTag.build();
        _$failedField = 'transaction';
        transaction.build();
        _$failedField = 'request';
        request.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserState extends UserState {
  @override
  final bool isLoggedIn;
  @override
  final bool isLoggingIn;
  @override
  final User profile;
  @override
  final BuiltMap<String, String> userDetails;

  factory _$UserState([void Function(UserStateBuilder) updates]) =>
      (new UserStateBuilder()..update(updates)).build();

  _$UserState._(
      {this.isLoggedIn, this.isLoggingIn, this.profile, this.userDetails})
      : super._();

  @override
  UserState rebuild(void Function(UserStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStateBuilder toBuilder() => new UserStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserState &&
        isLoggedIn == other.isLoggedIn &&
        isLoggingIn == other.isLoggingIn &&
        profile == other.profile &&
        userDetails == other.userDetails;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoggedIn.hashCode), isLoggingIn.hashCode),
            profile.hashCode),
        userDetails.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserState')
          ..add('isLoggedIn', isLoggedIn)
          ..add('isLoggingIn', isLoggingIn)
          ..add('profile', profile)
          ..add('userDetails', userDetails))
        .toString();
  }
}

class UserStateBuilder implements Builder<UserState, UserStateBuilder> {
  _$UserState _$v;

  bool _isLoggedIn;
  bool get isLoggedIn => _$this._isLoggedIn;
  set isLoggedIn(bool isLoggedIn) => _$this._isLoggedIn = isLoggedIn;

  bool _isLoggingIn;
  bool get isLoggingIn => _$this._isLoggingIn;
  set isLoggingIn(bool isLoggingIn) => _$this._isLoggingIn = isLoggingIn;

  UserBuilder _profile;
  UserBuilder get profile => _$this._profile ??= new UserBuilder();
  set profile(UserBuilder profile) => _$this._profile = profile;

  MapBuilder<String, String> _userDetails;
  MapBuilder<String, String> get userDetails =>
      _$this._userDetails ??= new MapBuilder<String, String>();
  set userDetails(MapBuilder<String, String> userDetails) =>
      _$this._userDetails = userDetails;

  UserStateBuilder();

  UserStateBuilder get _$this {
    if (_$v != null) {
      _isLoggedIn = _$v.isLoggedIn;
      _isLoggingIn = _$v.isLoggingIn;
      _profile = _$v.profile?.toBuilder();
      _userDetails = _$v.userDetails?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserState;
  }

  @override
  void update(void Function(UserStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserState build() {
    _$UserState _$result;
    try {
      _$result = _$v ??
          new _$UserState._(
              isLoggedIn: isLoggedIn,
              isLoggingIn: isLoggingIn,
              profile: _profile?.build(),
              userDetails: _userDetails?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'profile';
        _profile?.build();
        _$failedField = 'userDetails';
        _userDetails?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PriceTagState extends PriceTagState {
  @override
  final BuiltMap<VehicleType, PriceTag> priceTags;

  factory _$PriceTagState([void Function(PriceTagStateBuilder) updates]) =>
      (new PriceTagStateBuilder()..update(updates)).build();

  _$PriceTagState._({this.priceTags}) : super._();

  @override
  PriceTagState rebuild(void Function(PriceTagStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PriceTagStateBuilder toBuilder() => new PriceTagStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PriceTagState && priceTags == other.priceTags;
  }

  @override
  int get hashCode {
    return $jf($jc(0, priceTags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PriceTagState')
          ..add('priceTags', priceTags))
        .toString();
  }
}

class PriceTagStateBuilder
    implements Builder<PriceTagState, PriceTagStateBuilder> {
  _$PriceTagState _$v;

  MapBuilder<VehicleType, PriceTag> _priceTags;
  MapBuilder<VehicleType, PriceTag> get priceTags =>
      _$this._priceTags ??= new MapBuilder<VehicleType, PriceTag>();
  set priceTags(MapBuilder<VehicleType, PriceTag> priceTags) =>
      _$this._priceTags = priceTags;

  PriceTagStateBuilder();

  PriceTagStateBuilder get _$this {
    if (_$v != null) {
      _priceTags = _$v.priceTags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PriceTagState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PriceTagState;
  }

  @override
  void update(void Function(PriceTagStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PriceTagState build() {
    _$PriceTagState _$result;
    try {
      _$result = _$v ?? new _$PriceTagState._(priceTags: _priceTags?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'priceTags';
        _priceTags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PriceTagState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
