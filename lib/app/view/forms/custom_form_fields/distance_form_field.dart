import 'package:flutter/material.dart';

class DistanceFormField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final double? currentValue;

  const DistanceFormField({
    super.key,
    required this.onChanged,
    required this.currentValue,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: currentValue.toString(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: '3.1 miles',
        labelText: 'Distance',
        helperText: "",
      ),
      validator: validator,
    );
  }
}