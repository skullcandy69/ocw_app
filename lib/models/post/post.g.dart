// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Post> _$postSerializer = new _$PostSerializer();

class _$PostSerializer implements StructuredSerializer<Post> {
  @override
  final Iterable<Type> types = const [Post, _$Post];
  @override
  final String wireName = 'Post';

  @override
  Iterable<Object> serialize(Serializers serializers, Post object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.userId != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(object.userId,
            specifiedType: const FullType(String)));
    }
    if (object.userType != null) {
      result
        ..add('user_type')
        ..add(serializers.serialize(object.userType,
            specifiedType: const FullType(UserType)));
    }
    if (object.mobileNo != null) {
      result
        ..add('mobile_no')
        ..add(serializers.serialize(object.mobileNo,
            specifiedType: const FullType(String)));
    }
    if (object.pin != null) {
      result
        ..add('PIN')
        ..add(serializers.serialize(object.pin,
            specifiedType: const FullType(String)));
    }
    if (object.location != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.location,
            specifiedType: const FullType(String)));
    }
    if (object.viewAmount != null) {
      result
        ..add('view_amount')
        ..add(serializers.serialize(object.viewAmount,
            specifiedType: const FullType(String)));
    }
    if (object.rate != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(object.rate,
            specifiedType: const FullType(String)));
    }
    if (object.vehicleCategory != null) {
      result
        ..add('vehicle_cat')
        ..add(serializers.serialize(object.vehicleCategory,
            specifiedType: const FullType(VehicleCategory)));
    }
    if (object.vehicleType != null) {
      result
        ..add('vehicle_type')
        ..add(serializers.serialize(object.vehicleType,
            specifiedType: const FullType(VehicleType)));
    }
    if (object.makeAndModel != null) {
      result
        ..add('make_model')
        ..add(serializers.serialize(object.makeAndModel,
            specifiedType: const FullType(String)));
    }
    if (object.vehicleNo != null) {
      result
        ..add('vehicle_number')
        ..add(serializers.serialize(object.vehicleNo,
            specifiedType: const FullType(String)));
    }
    if (object.date != null) {
      result
        ..add('preffere_date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(String)));
    }
    if (object.createdAt != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(object.createdAt,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.acceptedBy != null) {
      result
        ..add('accepted_by')
        ..add(serializers.serialize(object.acceptedBy,
            specifiedType: const FullType(String)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    return result;
  }

  @override
  Post deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_type':
          result.userType = serializers.deserialize(value,
              specifiedType: const FullType(UserType)) as UserType;
          break;
        case 'mobile_no':
          result.mobileNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'PIN':
          result.pin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'view_amount':
          result.viewAmount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vehicle_cat':
          result.vehicleCategory = serializers.deserialize(value,
                  specifiedType: const FullType(VehicleCategory))
              as VehicleCategory;
          break;
        case 'vehicle_type':
          result.vehicleType = serializers.deserialize(value,
              specifiedType: const FullType(VehicleType)) as VehicleType;
          break;
        case 'make_model':
          result.makeAndModel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vehicle_number':
          result.vehicleNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'preffere_date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestamp':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accepted_by':
          result.acceptedBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
      }
    }

    return result.build();
  }
}

class _$Post extends Post {
  @override
  final String id;
  @override
  final String name;
  @override
  final String userId;
  @override
  final UserType userType;
  @override
  final String mobileNo;
  @override
  final String pin;
  @override
  final String location;
  @override
  final String viewAmount;
  @override
  final String rate;
  @override
  final VehicleCategory vehicleCategory;
  @override
  final VehicleType vehicleType;
  @override
  final String makeAndModel;
  @override
  final String vehicleNo;
  @override
  final String date;
  @override
  final String createdAt;
  @override
  final String status;
  @override
  final String acceptedBy;
  @override
  final User user;

  factory _$Post([void Function(PostBuilder) updates]) =>
      (new PostBuilder()..update(updates)).build();

  _$Post._(
      {this.id,
      this.name,
      this.userId,
      this.userType,
      this.mobileNo,
      this.pin,
      this.location,
      this.viewAmount,
      this.rate,
      this.vehicleCategory,
      this.vehicleType,
      this.makeAndModel,
      this.vehicleNo,
      this.date,
      this.createdAt,
      this.status,
      this.acceptedBy,
      this.user})
      : super._();

  @override
  Post rebuild(void Function(PostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostBuilder toBuilder() => new PostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        id == other.id &&
        name == other.name &&
        userId == other.userId &&
        userType == other.userType &&
        mobileNo == other.mobileNo &&
        pin == other.pin &&
        location == other.location &&
        viewAmount == other.viewAmount &&
        rate == other.rate &&
        vehicleCategory == other.vehicleCategory &&
        vehicleType == other.vehicleType &&
        makeAndModel == other.makeAndModel &&
        vehicleNo == other.vehicleNo &&
        date == other.date &&
        createdAt == other.createdAt &&
        status == other.status &&
        acceptedBy == other.acceptedBy &&
        user == other.user;
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            id
                                                                                .hashCode),
                                                                        name
                                                                            .hashCode),
                                                                    userId
                                                                        .hashCode),
                                                                userType
                                                                    .hashCode),
                                                            mobileNo.hashCode),
                                                        pin.hashCode),
                                                    location.hashCode),
                                                viewAmount.hashCode),
                                            rate.hashCode),
                                        vehicleCategory.hashCode),
                                    vehicleType.hashCode),
                                makeAndModel.hashCode),
                            vehicleNo.hashCode),
                        date.hashCode),
                    createdAt.hashCode),
                status.hashCode),
            acceptedBy.hashCode),
        user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Post')
          ..add('id', id)
          ..add('name', name)
          ..add('userId', userId)
          ..add('userType', userType)
          ..add('mobileNo', mobileNo)
          ..add('pin', pin)
          ..add('location', location)
          ..add('viewAmount', viewAmount)
          ..add('rate', rate)
          ..add('vehicleCategory', vehicleCategory)
          ..add('vehicleType', vehicleType)
          ..add('makeAndModel', makeAndModel)
          ..add('vehicleNo', vehicleNo)
          ..add('date', date)
          ..add('createdAt', createdAt)
          ..add('status', status)
          ..add('acceptedBy', acceptedBy)
          ..add('user', user))
        .toString();
  }
}

class PostBuilder implements Builder<Post, PostBuilder> {
  _$Post _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  UserType _userType;
  UserType get userType => _$this._userType;
  set userType(UserType userType) => _$this._userType = userType;

  String _mobileNo;
  String get mobileNo => _$this._mobileNo;
  set mobileNo(String mobileNo) => _$this._mobileNo = mobileNo;

  String _pin;
  String get pin => _$this._pin;
  set pin(String pin) => _$this._pin = pin;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  String _viewAmount;
  String get viewAmount => _$this._viewAmount;
  set viewAmount(String viewAmount) => _$this._viewAmount = viewAmount;

  String _rate;
  String get rate => _$this._rate;
  set rate(String rate) => _$this._rate = rate;

  VehicleCategory _vehicleCategory;
  VehicleCategory get vehicleCategory => _$this._vehicleCategory;
  set vehicleCategory(VehicleCategory vehicleCategory) =>
      _$this._vehicleCategory = vehicleCategory;

  VehicleType _vehicleType;
  VehicleType get vehicleType => _$this._vehicleType;
  set vehicleType(VehicleType vehicleType) => _$this._vehicleType = vehicleType;

  String _makeAndModel;
  String get makeAndModel => _$this._makeAndModel;
  set makeAndModel(String makeAndModel) => _$this._makeAndModel = makeAndModel;

  String _vehicleNo;
  String get vehicleNo => _$this._vehicleNo;
  set vehicleNo(String vehicleNo) => _$this._vehicleNo = vehicleNo;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _acceptedBy;
  String get acceptedBy => _$this._acceptedBy;
  set acceptedBy(String acceptedBy) => _$this._acceptedBy = acceptedBy;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  PostBuilder();

  PostBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _userId = _$v.userId;
      _userType = _$v.userType;
      _mobileNo = _$v.mobileNo;
      _pin = _$v.pin;
      _location = _$v.location;
      _viewAmount = _$v.viewAmount;
      _rate = _$v.rate;
      _vehicleCategory = _$v.vehicleCategory;
      _vehicleType = _$v.vehicleType;
      _makeAndModel = _$v.makeAndModel;
      _vehicleNo = _$v.vehicleNo;
      _date = _$v.date;
      _createdAt = _$v.createdAt;
      _status = _$v.status;
      _acceptedBy = _$v.acceptedBy;
      _user = _$v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Post other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Post;
  }

  @override
  void update(void Function(PostBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Post build() {
    _$Post _$result;
    try {
      _$result = _$v ??
          new _$Post._(
              id: id,
              name: name,
              userId: userId,
              userType: userType,
              mobileNo: mobileNo,
              pin: pin,
              location: location,
              viewAmount: viewAmount,
              rate: rate,
              vehicleCategory: vehicleCategory,
              vehicleType: vehicleType,
              makeAndModel: makeAndModel,
              vehicleNo: vehicleNo,
              date: date,
              createdAt: createdAt,
              status: status,
              acceptedBy: acceptedBy,
              user: _user?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Post', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
