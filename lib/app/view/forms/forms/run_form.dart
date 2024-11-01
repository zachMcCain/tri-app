import 'package:flutter/material.dart';
import 'package:tri/app/view/forms/field_options.dart';
import 'package:tri/app/view/view_picker/view_picker.dart';

class RunForm extends StatelessWidget {
  final ValueChanged<Object>? onChanged;

  final List<FieldOptions> fields = [
    FieldOptions.distance,
    FieldOptions.duration,
    // Add calories and pace (and maybe just a general purpose 'segment'?)
    // Add a warmup and cooldown section....
  ];

  RunForm({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(constraints: BoxConstraints(maxHeight: 350), child:
          ViewPicker(tiles: fields, insert: true, onChanged: onChanged,),
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