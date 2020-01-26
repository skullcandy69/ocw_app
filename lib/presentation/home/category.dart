import 'package:flutter/material.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';

class Category extends StatelessWidget {
  final String imageLoc;
  final String imageCap;
  final PriceTag priceTag;
  final Function onTap;

  Category({this.imageCap, this.imageLoc, this.priceTag,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          onTap(priceTag);
        },
        child: Container(
          width: 94,
          child: ListTile(
            title: Image.asset(
              imageLoc,
              width: 95,
              height: 50,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  imageCap,
                  style: TextStyle(fontSize: 12),
                )),
          ),
        ),
      ),
    );
  }
}
