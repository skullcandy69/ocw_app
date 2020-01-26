import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocw_app/actions/actions.dart';
import 'package:ocw_app/actions/post_action.dart';
import 'package:ocw_app/models/app_state.dart';
import 'package:ocw_app/models/post/post.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/models/vehicle/vehicle_category.dart';
import 'package:ocw_app/models/vehicle/vehicle_type.dart';
import 'package:ocw_app/presentation/booking_page.dart';
import 'package:redux/redux.dart';

class BookingContainer extends StatelessWidget {
  static const String routeNamed = 'Booking';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return Booking(
          onBooking: _viewModel.onBooking,
          user: _viewModel.user,
          isBooking: _viewModel.isBooking,
          price: _viewModel.price,
        );
      },
    );
  }
}

class _ViewModel {
  final User user;
  final Function onBooking;
  final bool isBooking;
  final Function onLoadingComplete;
  final Map<VehicleType, PriceTag> price;

  _ViewModel({
    this.user,
    this.isBooking,
    this.onBooking,
    this.onLoadingComplete,
    this.price,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        user: store.state.user.profile,
        onLoadingComplete: () {
          store.dispatch(LoadingAction(false));
        },
        price: store.state.priceTag.priceTags.toMap(),
        isBooking: store.state.post.isBooking,
        onBooking: (
            {String location,
            String mobileNo,
            String name,
            VehicleCategory vehicleCategory,
            VehicleType vehicleType,
            String vehicleNumber,
            String viewAmount,
            String pin,
            String vehicleDetail,
            String preferredDate,
            UserType userType}) {
          Post post = Post().rebuild((b) {
            b..name = name;
            b..viewAmount = viewAmount;
            b..mobileNo = mobileNo;
            b..userId = store.state.user.profile.id;
            b..vehicleCategory = vehicleCategory;
            b..vehicleType = vehicleType;
            b..location = location;
            b..date = preferredDate;
            b..pin = pin;
            b..vehicleNo = vehicleNumber;
            b..userType = userType;
          });

          store.dispatch(CreatePost(post, userType));
        });
  }
}
