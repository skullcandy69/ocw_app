import 'package:flutter/material.dart';
import 'package:ocw_app/models/vehicle/wash_service.dart';

class Check extends StatelessWidget {
  final WashService text;
  final Function add;
  final Function remove;
  final bool isChecked;

  Check(this.text, this.add, this.remove, this.isChecked);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (bool selected) {
        if (isChecked) {
          remove(text);
        } else {
          add(text);
        }
      },
      title: Text(
        WashService.displayValueOf(text),
        style: TextStyle(color: Colors.green),
      ),
    );
  }
}
