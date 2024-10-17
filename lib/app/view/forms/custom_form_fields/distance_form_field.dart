import 'package:flutter/material.dart';
import 'package:tri/app/view/view_picker/abstract_result_widget.dart';

class DistanceFormField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final double? currentValue;

  DistanceFormField({
    super.key,
    required this.onChanged,
    required this.currentValue,
    required this.validator,
  });

  @override
  State<DistanceFormField> createState() => _DistanceFormFieldState();
}

class _DistanceFormFieldState extends State<DistanceFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.currentValue.toString(),
      onChanged: widget.onChanged,
      decoration: const InputDecoration(
        hintText: '3.1 miles',
        labelText: 'Distance',
        helperText: "",
      ),
      validator: widget.validator,
      keyboardType: TextInputType.number,
    );
  }
}