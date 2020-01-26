// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.firstName != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(object.firstName,
            specifiedType: const FullType(String)));
    }
    if (object.lastName != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(object.lastName,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.parentId != null) {
      result
        ..add('parentId')
        ..add(serializers.serialize(object.parentId,
            specifiedType: const FullType(String)));
    }
    if (object.emailId != null) {
      result
        ..add('email_id')
        ..add(serializers.serialize(object.emailId,
            specifiedType: const FullType(String)));
    }
    if (object.pin != null) {
      result
        ..add('PIN')
        ..add(serializers.serialize(object.pin,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.imageUrl != null) {
      result
        ..add('image_url')
        ..add(serializers.serialize(object.imageUrl,
            specifiedType: const FullType(String)));
    }
    if (object.street != null) {
      result
        ..add('street')
        ..add(serializers.serialize(object.street,
            specifiedType: const FullType(String)));
    }
    if (object.state != null) {
      result
        ..add('state')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(String)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    if (object.amount != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(object.amount,
            specifiedType: const FullType(String)));
    }
    if (object.city != null) {
      result
        ..add('city')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.userType != null) {
      result
        ..add('user_type')
        ..add(serializers.serialize(object.userType,
            specifiedType: const FullType(UserType)));
    }
    if (object.phoneNumber != null) {
      result
        ..add('mobile_no')
        ..add(serializers.serialize(object.phoneNumber,
            specifiedType: const FullType(String)));
    }
    if (object.totalPost != null) {
      result
        ..add('total_post')
        ..add(serializers.serialize(object.totalPost,
            specifiedType: const FullType(String)));
    }
    if (object.reportPost != null) {
      result
        ..add('report_post')
        ..add(serializers.serialize(object.reportPost,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parentId':
          result.parentId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email_id':
          result.emailId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'PIN':
          result.pin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image_url':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'street':
          result.street = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_type':
          result.userType = serializers.deserialize(value,
              specifiedType: const FullType(UserType)) as UserType;
          break;
        case 'mobile_no':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'total_post':
          result.totalPost = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'report_post':
          result.reportPost = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String id;
  @override
  final String parentId;
  @override
  final String emailId;
  @override
  final String pin;
  @override
  final String address;
  @override
  final String imageUrl;
  @override
  final String street;
  @override
  final String state;
  @override
  final String password;
  @override
  final String amount;
  @override
  final String city;
  @override
  final UserType userType;
  @override
  final String phoneNumber;
  @override
  final String totalPost;
  @override
  final String reportPost;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.firstName,
      this.lastName,
      this.id,
      this.parentId,
      this.emailId,
      this.pin,
      this.address,
      this.imageUrl,
      this.street,
      this.state,
      this.password,
      this.amount,
      this.city,
      this.userType,
      this.phoneNumber,
      this.totalPost,
      this.reportPost})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        id == other.id &&
        parentId == other.parentId &&
        emailId == other.emailId &&
        pin == other.pin &&
        address == other.address &&
        imageUrl == other.imageUrl &&
        street == other.street &&
        state == other.state &&
        password == other.password &&
        amount == other.amount &&
        city == other.city &&
        userType == other.userType &&
        phoneNumber == other.phoneNumber &&
        totalPost == other.totalPost &&
        reportPost == other.reportPost;
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
                                                                        0,
                                                                        firstName
                                                                            .hashCode),
                                                                    lastName
                                                                        .hashCode),
                                                                id.hashCode),
                                                            parentId.hashCode),
                                                        emailId.hashCode),
                                                    pin.hashCode),
                                                address.hashCode),
                                            imageUrl.hashCode),
                                        street.hashCode),
                                    state.hashCode),
                                password.hashCode),
                            amount.hashCode),
                        city.hashCode),
                    userType.hashCode),
                phoneNumber.hashCode),
            totalPost.hashCode),
        reportPost.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('id', id)
          ..add('parentId', parentId)
          ..add('emailId', emailId)
          ..add('pin', pin)
          ..add('address', address)
          ..add('imageUrl', imageUrl)
          ..add('street', street)
          ..add('state', state)
          ..add('password', password)
          ..add('amount', amount)
          ..add('city', city)
          ..add('userType', userType)
          ..add('phoneNumber', phoneNumber)
          ..add('totalPost', totalPost)
          ..add('reportPost', reportPost))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _parentId;
  String get parentId => _$this._parentId;
  set parentId(String parentId) => _$this._parentId = parentId;

  String _emailId;
  String get emailId => _$this._emailId;
  set emailId(String emailId) => _$this._emailId = emailId;

  String _pin;
  String get pin => _$this._pin;
  set pin(String pin) => _$this._pin = pin;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  String _street;
  String get street => _$this._street;
  set street(String street) => _$this._street = street;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _amount;
  String get amount => _$this._amount;
  set amount(String amount) => _$this._amount = amount;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  UserType _userType;
  UserType get userType => _$this._userType;
  set userType(UserType userType) => _$this._userType = userType;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _totalPost;
  String get totalPost => _$this._totalPost;
  set totalPost(String totalPost) => _$this._totalPost = totalPost;

  String _reportPost;
  String get reportPost => _$this._reportPost;
  set reportPost(String reportPost) => _$this._reportPost = reportPost;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _id = _$v.id;
      _parentId = _$v.parentId;
      _emailId = _$v.emailId;
      _pin = _$v.pin;
      _address = _$v.address;
      _imageUrl = _$v.imageUrl;
      _street = _$v.street;
      _state = _$v.state;
      _password = _$v.password;
      _amount = _$v.amount;
      _city = _$v.city;
      _userType = _$v.userType;
      _phoneNumber = _$v.phoneNumber;
      _totalPost = _$v.totalPost;
      _reportPost = _$v.reportPost;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            firstName: firstName,
            lastName: lastName,
            id: id,
            parentId: parentId,
            emailId: emailId,
            pin: pin,
            address: address,
            imageUrl: imageUrl,
            street: street,
            state: state,
            password: password,
            amount: amount,
            city: city,
            userType: userType,
            phoneNumber: phoneNumber,
            totalPost: totalPost,
            reportPost: reportPost);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
