import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ocw_app/models/vehicle/vehicle_type.dart';

part 'price_tag.g.dart';

abstract class PriceTag implements Built<PriceTag, PriceTagBuilder> {
  static Serializer<PriceTag> get serializer => _$priceTagSerializer;

  @nullable
  @BuiltValueField(wireName: "vehicle_type")
  VehicleType get vehicleType;

  @nullable
  @BuiltValueField(wireName: "steam_wash")
  String get steamWash;

  @nullable
  @BuiltValueField(wireName: "vacuum_cleaning")
  String get vacuumCleaning;

  @nullable
  @BuiltValueField(wireName: "automatic_waxing")
  String get automaticWaxing;

  @nullable
  @BuiltValueField(wireName: "rubbing_polish")
  String get rubberPolish;

  @nullable
  @BuiltValueField(wireName: "seat_cleaning")
  String get seatCleaning;

  @nullable
  String get package;

  @nullable
  String get combined;

  PriceTag._();

  factory PriceTag([updates(PriceTagBuilder b)]) = _$PriceTag;
}
