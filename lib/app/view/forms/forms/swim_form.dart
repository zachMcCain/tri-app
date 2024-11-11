import 'package:flutter/material.dart';
import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/view/forms/custom_form_fields/distance_form_field.dart';
import 'package:tri/app/view/forms/custom_form_fields/duration_form_field.dart';
import 'package:tri/app/view/forms/custom_form_fields/pace_form_field.dart';
import 'package:tri/app/view/forms/field_options.dart';
import 'package:tri/app/view/widgets/tri_header.dart';

class SwimForm extends StatelessWidget {
  final ValueChanged<Object> onChanged;

  final List<FieldOptions> fields = [
    FieldOptions.distance,
    FieldOptions.duration,
  ];

  SwimForm({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
        return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TriHeader(header: 'Add a Segment'),
        DistanceFormField(onChanged: onChanged, distanceUnit: DistanceUnit.m, decimal: false, step: 25, paceMode: PaceMode.meters,),
        const SizedBox(height: 5,),
        DurationFormField(onChanged: onChanged, paceMode: PaceMode.meters,),
      ]
    );
  }
}
