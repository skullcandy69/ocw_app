import 'package:flutter/material.dart';
import 'package:ocw_app/containers/booking_container.dart';
import 'package:ocw_app/containers/home_container.dart';
import 'package:ocw_app/containers/profile_page_container.dart';

class Body extends StatelessWidget {
  final int index;

  Body(this.index);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return HomeContainer();

        break;
      case 3:
        return BookingContainer();
        break;
      default:
        return ProfileContainer();
        break;
    }
  }
}
