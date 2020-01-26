// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_tag.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PriceTag> _$priceTagSerializer = new _$PriceTagSerializer();

class _$PriceTagSerializer implements StructuredSerializer<PriceTag> {
  @override
  final Iterable<Type> types = const [PriceTag, _$PriceTag];
  @override
  final String wireName = 'PriceTag';

  @override
  Iterable<Object> serialize(Serializers serializers, PriceTag object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.vehicleType != null) {
      result
        ..add('vehicle_type')
        ..add(serializers.serialize(object.vehicleType,
            specifiedType: const FullType(VehicleType)));
    }
    if (object.steamWash != null) {
      result
        ..add('steam_wash')
        ..add(serializers.serialize(object.steamWash,
            specifiedType: const FullType(String)));
    }
    if (object.vacuumCleaning != null) {
      result
        ..add('vacuum_cleaning')
        ..add(serializers.serialize(object.vacuumCleaning,
            specifiedType: const FullType(String)));
    }
    if (object.automaticWaxing != null) {
      result
        ..add('automatic_waxing')
        ..add(serializers.serialize(object.automaticWaxing,
            specifiedType: const FullType(String)));
    }
    if (object.rubberPolish != null) {
      result
        ..add('rubbing_polish')
        ..add(serializers.serialize(object.rubberPolish,
            specifiedType: const FullType(String)));
    }
    if (object.seatCleaning != null) {
      result
        ..add('seat_cleaning')
        ..add(serializers.serialize(object.seatCleaning,
            specifiedType: const FullType(String)));
    }
    if (object.package != null) {
      result
        ..add('package')
        ..add(serializers.serialize(object.package,
            specifiedType: const FullType(String)));
    }
    if (object.combined != null) {
      result
        ..add('combined')
        ..add(serializers.serialize(object.combined,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PriceTag deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PriceTagBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'vehicle_type':
          result.vehicleType = serializers.deserialize(value,
              specifiedType: const FullType(VehicleType)) as VehicleType;
          break;
        case 'steam_wash':
          result.steamWash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vacuum_cleaning':
          result.vacuumCleaning = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'automatic_waxing':
          result.automaticWaxing = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rubbing_polish':
          result.rubberPolish = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'seat_cleaning':
          result.seatCleaning = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'package':
          result.package = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'combined':
          result.combined = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PriceTag extends PriceTag {
  @override
  final VehicleType vehicleType;
  @override
  final String steamWash;
  @override
  final String vacuumCleaning;
  @override
  final String automaticWaxing;
  @override
  final String rubberPolish;
  @override
  final String seatCleaning;
  @override
  final String package;
  @override
  final String combined;

  factory _$PriceTag([void Function(PriceTagBuilder) updates]) =>
      (new PriceTagBuilder()..update(updates)).build();

  _$PriceTag._(
      {this.vehicleType,
      this.steamWash,
      this.vacuumCleaning,
      this.automaticWaxing,
      this.rubberPolish,
      this.seatCleaning,
      this.package,
      this.combined})
      : super._();

  @override
  PriceTag rebuild(void Function(PriceTagBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PriceTagBuilder toBuilder() => new PriceTagBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PriceTag &&
        vehicleType == other.vehicleType &&
        steamWash == other.steamWash &&
        vacuumCleaning == other.vacuumCleaning &&
        automaticWaxing == other.automaticWaxing &&
        rubberPolish == other.rubberPolish &&
        seatCleaning == other.seatCleaning &&
        package == other.package &&
        combined == other.combined;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, vehicleType.hashCode),
                                steamWash.hashCode),
                            vacuumCleaning.hashCode),
                        automaticWaxing.hashCode),
                    rubberPolish.hashCode),
                seatCleaning.hashCode),
            package.hashCode),
        combined.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PriceTag')
          ..add('vehicleType', vehicleType)
          ..add('steamWash', steamWash)
          ..add('vacuumCleaning', vacuumCleaning)
          ..add('automaticWaxing', automaticWaxing)
          ..add('rubberPolish', rubberPolish)
          ..add('seatCleaning', seatCleaning)
          ..add('package', package)
          ..add('combined', combined))
        .toString();
  }
}

class PriceTagBuilder implements Builder<PriceTag, PriceTagBuilder> {
  _$PriceTag _$v;

  VehicleType _vehicleType;
  VehicleType get vehicleType => _$this._vehicleType;
  set vehicleType(VehicleType vehicleType) => _$this._vehicleType = vehicleType;

  String _steamWash;
  String get steamWash => _$this._steamWash;
  set steamWash(String steamWash) => _$this._steamWash = steamWash;

  String _vacuumCleaning;
  String get vacuumCleaning => _$this._vacuumCleaning;
  set vacuumCleaning(String vacuumCleaning) =>
      _$this._vacuumCleaning = vacuumCleaning;

  String _automaticWaxing;
  String get automaticWaxing => _$this._automaticWaxing;
  set automaticWaxing(String automaticWaxing) =>
      _$this._automaticWaxing = automaticWaxing;

  String _rubberPolish;
  String get rubberPolish => _$this._rubberPolish;
  set rubberPolish(String rubberPolish) => _$this._rubberPolish = rubberPolish;

  String _seatCleaning;
  String get seatCleaning => _$this._seatCleaning;
  set seatCleaning(String seatCleaning) => _$this._seatCleaning = seatCleaning;

  String _package;
  String get package => _$this._package;
  set package(String package) => _$this._package = package;

  String _combined;
  String get combined => _$this._combined;
  set combined(String combined) => _$this._combined = combined;

  PriceTagBuilder();

  PriceTagBuilder get _$this {
    if (_$v != null) {
      _vehicleType = _$v.vehicleType;
      _steamWash = _$v.steamWash;
      _vacuumCleaning = _$v.vacuumCleaning;
      _automaticWaxing = _$v.automaticWaxing;
      _rubberPolish = _$v.rubberPolish;
      _seatCleaning = _$v.seatCleaning;
      _package = _$v.package;
      _combined = _$v.combined;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PriceTag other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PriceTag;
  }

  @override
  void update(void Function(PriceTagBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PriceTag build() {
    final _$result = _$v ??
        new _$PriceTag._(
            vehicleType: vehicleType,
            steamWash: steamWash,
            vacuumCleaning: vacuumCleaning,
            automaticWaxing: automaticWaxing,
            rubberPolish: rubberPolish,
            seatCleaning: seatCleaning,
            package: package,
            combined: combined);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
