import 'package:flutter/material.dart';
import 'package:tri/app/utils/validators.dart';
import 'package:tri/app/view/forms/custom_form_fields/distance_form_field.dart';

class SwimForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "Placeholder for Stroke Count"),
          ),
          DistanceFormField(
            onChanged: (value) => {}, currentValue: 0.0, validator: Validators.isNumber
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Placeholder for Pace"),
          ),
        ]
      ),
    );
  }
}
