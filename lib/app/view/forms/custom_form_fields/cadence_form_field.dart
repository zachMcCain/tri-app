import 'package:flutter/material.dart';

class CadenceFormField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final double? currentValue;

  const CadenceFormField({
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
        hintText: 'Turnover per minute',
        labelText: 'Cadence',
        helperText: "",
      ),
      validator: validator,
      keyboardType: TextInputType.number,
    );
  }
}