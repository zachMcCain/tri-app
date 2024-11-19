import 'package:flutter/material.dart';
import 'package:tri/app/view/forms/custom_form_fields/text_form_field.dart';
import 'package:tri/app/view/forms/field_options.dart';
import 'package:tri/app/view/widgets/tri_header.dart';

class StrengthForm extends StatelessWidget {
  final ValueChanged<Object> onChanged;

  final List<FieldOptions> fields = [
    FieldOptions.duration
  ];

  StrengthForm({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TriHeader(header: 'Add a Set'),
        TextSegmentFormField(onChanged: onChanged, hintText: 'Set Description')
      ],
    );
  }

}