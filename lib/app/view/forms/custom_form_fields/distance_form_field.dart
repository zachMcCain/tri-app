import 'package:flutter/material.dart';

class DistanceFormField extends StatefulWidget {
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
  State<DistanceFormField> createState() => _DistanceFormFieldState();
}

class _DistanceFormFieldState extends State<DistanceFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        // initialValue: widget.currentValue.toString(),
        onChanged: widget.onChanged,
        decoration: const InputDecoration(
          hintText: '3.1',
          labelText: 'Distance',
          helperText: "",
          suffixText: "miles"
        ),
        validator: widget.validator,
        keyboardType: TextInputType.number,
      ),
    );
  }
}