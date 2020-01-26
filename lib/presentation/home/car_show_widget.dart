import 'package:flutter/material.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/models/vehicle/vehicle_type.dart';
import 'package:ocw_app/presentation/home/category.dart';
import 'package:ocw_app/utils/size_config.dart';

class CarShowWidget extends StatelessWidget {
  final Map<VehicleType, PriceTag> priceTag;
  final Function onTap;

  CarShowWidget(this.priceTag, this.onTap);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.09,
      width: SizeConfig.screenWidth,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
              onTap: onTap,
              imageLoc: 'assets/hatchback.jpg',
              imageCap: 'hatchback',
              priceTag: priceTag[VehicleType.huchback]),
          Category(
              onTap: onTap,
              imageLoc: 'assets/sports.png',
              imageCap: 'sports',
              priceTag: priceTag[VehicleType.suv]),
          Category(
              onTap: onTap,
              imageLoc: 'assets/sedan.png',
              imageCap: 'sedan',
              priceTag: priceTag[VehicleType.sedan]),
          Category(
              onTap: onTap,
              imageLoc: 'assets/premium.png',
              imageCap: 'premium',
              priceTag: priceTag[VehicleType.luxury])
        ],
      ),
    );
  }
}
