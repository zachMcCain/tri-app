import 'package:flutter/material.dart';
import 'package:tri/app/view/forms/field_options.dart';
import 'package:tri/app/view/view_picker/view_picker.dart';

class SwimForm extends StatelessWidget {
  final ValueChanged<Object>? onChanged;

  final List<FieldOptions> fields = [
    FieldOptions.distance,
    FieldOptions.duration,
  ];

  SwimForm({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
        return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(constraints: const BoxConstraints(maxHeight: 350), child:
          ViewPicker(tiles: fields, onChanged: onChanged,),
        ),
      ]
    );
  }
}
