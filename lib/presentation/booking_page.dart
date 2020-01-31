import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:ocw_app/models/user/user.dart';
import 'package:ocw_app/models/user/user_type.dart';
import 'package:ocw_app/models/vehicle/price_tag.dart';
import 'package:ocw_app/models/vehicle/vehicle_category.dart';
import 'package:ocw_app/models/vehicle/vehicle_type.dart';
import 'package:ocw_app/utils/size_config.dart';
import 'package:ocw_app/utils/string.dart';
import 'package:toast/toast.dart';

class Booking extends StatefulWidget {
  final Function onBooking;
  final isBooking;
  final User user;
  final Map<VehicleType, PriceTag> price;
  final Function onReport;

  Booking(
      {this.onBooking, this.user, this.isBooking, this.price, this.onReport});

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final _formKey = GlobalKey<FormState>();

  String name;

  String email;

  String pin;

  String location;

  String vehicleDetails = '';

  String vehicleNumber = '';

  VehicleCategory vehicleCategory = VehicleCategory.car;

  VehicleType vehicleType = VehicleType.sedan;

  String viewAmount = '20';

  String mobileNo = '';

  bool promo = false;

  String code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = widget.user.fullName;
    email = widget.user.emailId;

    location = widget.user.address;
    mobileNo = widget.user.phoneNumber;
  }

  final ScrollController scrollController = ScrollController();
  DateTime startDate;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          onChanged: () => _formKey.currentState.validate(),
          key: _formKey,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              controller: scrollController,
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      child: AutoSizeText(
                        'Enter Details',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          width: 2,
                          color: Colors.green,
                        ),
                      ),
                      child: TextFormField(
                        initialValue: name,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                        ),
                        validator: (value) {
                          String pattern = r'([a-zA-Z]$)';
                          RegExp rx = new RegExp(pattern);
                          if (value.isEmpty) {
                            return 'Name required'; //StringUtil.FIRST_NAME_REQUIRED_TEXT;
                          } else if (!rx.hasMatch(value)) {
                            return 'Enter a valid name';
                          }

                          return null;
                        },
                        onSaved: (data) {
                          name = data.trim();
                        },
                        onEditingComplete: () =>
                            _formKey.currentState.validate(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                          //StringUtil.FIRST_NAME_TEXT,
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          width: 2,
                          color: Colors.green,
                        ),
                      ),
                      child: DropdownButtonFormField<VehicleCategory>(
                        items: VehicleCategory.values
                            .toList()
                            .map(
                              (VehicleCategory g) => DropdownMenuItem(
                                value: g,
                                child: Text(
                                  VehicleCategory.displayValueOf(g),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        value: vehicleCategory,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (VehicleCategory userVehicle) {
                          setState(() {
                            vehicleCategory = userVehicle;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    vehicleCategory == VehicleCategory.car
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                width: 2,
                                color: Colors.green,
                              ),
                            ),
                            child: DropdownButtonFormField<VehicleType>(
                              items: VehicleType.values
                                  .toList()
                                  .map(
                                    (VehicleType g) => DropdownMenuItem(
                                      value: g,
                                      child: Text(
                                        VehicleType.displayValueOf(g),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              value: vehicleType,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (VehicleType userVehicle) {
                                setState(() {
                                  vehicleType = userVehicle;
                                });
                              },
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: vehicleCategory == VehicleCategory.car ? 20 : 0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          width: 2,
                          color: Colors.green,
                        ),
                      ),
                      child: TextFormField(
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                        ),
                        keyboardType: TextInputType.text,
                        validator: (String value) {
                          if (value.trim().length < 4) {
                            return 'Required';
                          }

                          return null;
                        },
                        onSaved: (String data) {
                          vehicleNumber = data.trim();
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Vehicle Details',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          width: 2,
                          color: Colors.green,
                        ),
                      ),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                        ),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Pin required'; //StringUtil.FIRST_NAME_REQUIRED_TEXT;
                          }
                        },
                        onSaved: (data) {
                          pin = data.trim();
                        },
                        onEditingComplete: () =>
                            _formKey.currentState.validate(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pin Code',
                          //StringUtil.FIRST_NAME_TEXT,
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          width: 2,
                          color: Colors.green,
                        ),
                      ),
                      child: TextFormField(
                        initialValue: mobileNo,
                        maxLength: 10,
//                        minLines: 10,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (String value) {
                          String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regExp = new RegExp(pattern);
                          if (value.trim().isEmpty) {
                            return 'Mobile Number is required'; //StringUtil.AGE_REQUIRED_TEXT;
                          } else if (value.trim().length < 10) {
                            return "Enter 10 digits";
                          } else if (!regExp.hasMatch(value)) {
                            return 'Please enter valid mobile number';
                          }

                          return null;
                        },
                        onSaved: (String data) {
                          mobileNo = data.trim();
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: '',
                          hintText: 'Mobile Number', //StringUtil.AGE_TEXT,
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          currentTime: DateTime.now(),
                          onConfirm: (DateTime date) {
                            setState(() {
                              startDate = date;
                            });
                          },
                        );
                      },
                      child: Container(
                        width: SizeConfig.screenWidth * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: IgnorePointer(
                          ignoring: true,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.green,
                            ),
                            validator: (String value) {
                              if (startDate == null) {
                                return 'Date is required';
                              }
                              return null;
                            },
                            controller: TextEditingController(
                                text: startDate == null
                                    ? ''
                                    : DateFormat.yMMMMd().format(startDate)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Preferred Date',
                              hintStyle: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          width: 2,
                          color: Colors.green,
                        ),
                      ),
                      child: TextFormField(
                        maxLines: 4,
                        initialValue: location,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                        ),
                        keyboardType: TextInputType.text,
                        validator: (String value) {
                          if (value.trim().isEmpty) {
                            return 'Required'; //StringUtil.AGE_REQUIRED_TEXT;
                          }
                          if (value.trim().length < 11) {
                            return 'It should be more than 10'; //StringUtil.AGE_REQUIRED_TEXT;
                          }

                          return null;
                        },
                        onSaved: (String data) {
                          location = data.trim();
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Proper Address',
                          //StringUtil.AGE_TEXT,
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:
                          !(widget.user.userType == UserType.client) ? 20.0 : 0,
                    ),
                    !(widget.user.userType == UserType.client)
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                width: 2,
                                color: Colors.green,
                              ),
                            ),
                            child: TextFormField(
                              maxLength: 10,
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                              ),
                              keyboardType: TextInputType.phone,
                              onSaved: (String data) {
                                if (data.trim().isNotEmpty) {
                                  viewAmount = data.trim();
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                counterText: '',
                                hintText: 'Booking View Amount',
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                        child: widget.isBooking
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                (widget.user.userType == UserType.client)
                                    ? 'Book'
                                    : 'Post',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                      onPressed: () {
                        _formKey.currentState.save();
                        if (_formKey.currentState.validate()) {
                          print(viewAmount);
                          widget.onBooking(
                              name: name,
                              location: location,
                              mobileNo: mobileNo,
                              pin: pin,
                              preferredDate: startDate.toString(),
                              vehicleCategory: vehicleCategory,
                              vehicleDetail: vehicleDetails,
                              vehicleNumber: vehicleNumber,
                              vehicleType: vehicleType,
                              viewAmount: viewAmount,
                              userType: widget.user.userType);
                          Toast.show('WE WILL REACH AT YOUR DOORSTEP', context,
                              duration: 2);
                        }
                      },
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
