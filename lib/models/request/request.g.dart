// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Request> _$requestSerializer = new _$RequestSerializer();

class _$RequestSerializer implements StructuredSerializer<Request> {
  @override
  final Iterable<Type> types = const [Request, _$Request];
  @override
  final String wireName = 'Request';

  @override
  Iterable<Object> serialize(Serializers serializers, Request object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.userId != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(object.userId,
            specifiedType: const FullType(String)));
    }
    if (object.parentId != null) {
      result
        ..add('parent_id')
        ..add(serializers.serialize(object.parentId,
            specifiedType: const FullType(String)));
    }
    if (object.postId != null) {
      result
        ..add('post_id')
        ..add(serializers.serialize(object.postId,
            specifiedType: const FullType(String)));
    }
    if (object.userName != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(object.userName,
            specifiedType: const FullType(String)));
    }
    if (object.amount != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(object.amount,
            specifiedType: const FullType(String)));
    }
    if (object.userType != null) {
      result
        ..add('user_type')
        ..add(serializers.serialize(object.userType,
            specifiedType: const FullType(UserType)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(TransactionStatus)));
    }
    if (object.reason != null) {
      result
        ..add('reason')
        ..add(serializers.serialize(object.reason,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.timestamp != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(object.timestamp,
            specifiedType: const FullType(String)));
    }
    if (object.request != null) {
      result
        ..add('requested_for')
        ..add(serializers.serialize(object.request,
            specifiedType: const FullType(RequestType)));
    }
    return result;
  }

  @override
  Request deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parent_id':
          result.parentId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'post_id':
          result.postId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_type':
          result.userType = serializers.deserialize(value,
              specifiedType: const FullType(UserType)) as UserType;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
                  specifiedType: const FullType(TransactionStatus))
              as TransactionStatus;
          break;
        case 'reason':
          result.reason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'requested_for':
          result.request = serializers.deserialize(value,
              specifiedType: const FullType(RequestType)) as RequestType;
          break;
      }
    }

    return result.build();
  }
}

class _$Request extends Request {
  @override
  final String id;
  @override
  final String userId;
  @override
  final String parentId;
  @override
  final String postId;
  @override
  final String userName;
  @override
  final String amount;
  @override
  final UserType userType;
  @override
  final TransactionStatus status;
  @override
  final String reason;
  @override
  final String description;
  @override
  final String timestamp;
  @override
  final RequestType request;

  factory _$Request([void Function(RequestBuilder) updates]) =>
      (new RequestBuilder()..update(updates)).build();

  _$Request._(
      {this.id,
      this.userId,
      this.parentId,
      this.postId,
      this.userName,
      this.amount,
      this.userType,
      this.status,
      this.reason,
      this.description,
      this.timestamp,
      this.request})
      : super._();

  @override
  Request rebuild(void Function(RequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestBuilder toBuilder() => new RequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Request &&
        id == other.id &&
        userId == other.userId &&
        parentId == other.parentId &&
        postId == other.postId &&
        userName == other.userName &&
        amount == other.amount &&
        userType == other.userType &&
        status == other.status &&
        reason == other.reason &&
        description == other.description &&
        timestamp == other.timestamp &&
        request == other.request;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, id.hashCode),
                                                userId.hashCode),
                                            parentId.hashCode),
                                        postId.hashCode),
                                    userName.hashCode),
                                amount.hashCode),
                            userType.hashCode),
                        status.hashCode),
                    reason.hashCode),
                description.hashCode),
            timestamp.hashCode),
        request.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Request')
          ..add('id', id)
          ..add('userId', userId)
          ..add('parentId', parentId)
          ..add('postId', postId)
          ..add('userName', userName)
          ..add('amount', amount)
          ..add('userType', userType)
          ..add('status', status)
          ..add('reason', reason)
          ..add('description', description)
          ..add('timestamp', timestamp)
          ..add('request', request))
        .toString();
  }
}

class RequestBuilder implements Builder<Request, RequestBuilder> {
  _$Request _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _parentId;
  String get parentId => _$this._parentId;
  set parentId(String parentId) => _$this._parentId = parentId;

  String _postId;
  String get postId => _$this._postId;
  set postId(String postId) => _$this._postId = postId;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  String _amount;
  String get amount => _$this._amount;
  set amount(String amount) => _$this._amount = amount;

  UserType _userType;
  UserType get userType => _$this._userType;
  set userType(UserType userType) => _$this._userType = userType;

  TransactionStatus _status;
  TransactionStatus get status => _$this._status;
  set status(TransactionStatus status) => _$this._status = status;

  String _reason;
  String get reason => _$this._reason;
  set reason(String reason) => _$this._reason = reason;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _timestamp;
  String get timestamp => _$this._timestamp;
  set timestamp(String timestamp) => _$this._timestamp = timestamp;

  RequestType _request;
  RequestType get request => _$this._request;
  set request(RequestType request) => _$this._request = request;

  RequestBuilder();

  RequestBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _userId = _$v.userId;
      _parentId = _$v.parentId;
      _postId = _$v.postId;
      _userName = _$v.userName;
      _amount = _$v.amount;
      _userType = _$v.userType;
      _status = _$v.status;
      _reason = _$v.reason;
      _description = _$v.description;
      _timestamp = _$v.timestamp;
      _request = _$v.request;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Request other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Request;
  }

  @override
  void update(void Function(RequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Request build() {
    final _$result = _$v ??
        new _$Request._(
            id: id,
            userId: userId,
            parentId: parentId,
            postId: postId,
            userName: userName,
            amount: amount,
            userType: userType,
            status: status,
            reason: reason,
            description: description,
            timestamp: timestamp,
            request: request);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
