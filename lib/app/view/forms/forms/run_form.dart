import 'package:flutter/material.dart';
import 'package:tri/app/view/forms/custom_form_fields/distance_form_field.dart';
import 'package:tri/app/view/forms/custom_form_fields/duration_form_field.dart';
import 'package:tri/app/view/forms/field_options.dart';
import 'package:tri/app/view/widgets/tri_header.dart';

class RunForm extends StatelessWidget {
  final ValueChanged<Object> onChanged;

  final List<FieldOptions> fields = [
    FieldOptions.distance,
    FieldOptions.duration,
  ];

  RunForm({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TriHeader(header: 'Add a Segment'),
        DistanceFormField(onChanged: onChanged),
        const SizedBox(height: 5,),
        DurationFormField(onChanged: onChanged),
      ]
    );
  }
}