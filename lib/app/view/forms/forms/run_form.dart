import 'package:flutter/material.dart';
import 'package:tri/app/utils/validators.dart';
import 'package:tri/app/view/forms/custom_form_fields/distance_form_field.dart';
import 'package:tri/app/view/forms/field_options.dart';
import 'package:tri/app/view/view_picker/view_picker.dart';

class RunForm extends StatelessWidget {

  final List<FieldOptions> fields = [
    FieldOptions.distance,
    FieldOptions.duration,
  ];

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(constraints: BoxConstraints(maxHeight: 350), child:
          ViewPicker(tiles: fields, insert: true,),
        ),
        // TextFormField(
        //   decoration: InputDecoration(hintText: "Placeholder for Cadence"),
        // ),
        // DistanceFormField(
        //   onChanged: (value) => {}, currentValue: 0.0, validator: Validators.isNumber
        // ),
        // TextFormField(
        //   decoration: InputDecoration(hintText: "Placeholder for Elevation"),
        // ),
        // TextFormField(
        //   decoration: InputDecoration(hintText: "Placeholder for Pace"),
        // ),
        // TextFormField(
        //   decoration: InputDecoration(hintText: "Placeholder for Power"),
        // ),
      ]
    );
  }
}