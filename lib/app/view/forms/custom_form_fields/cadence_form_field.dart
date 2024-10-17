import 'package:flutter/material.dart';
import 'package:tri/app/view/view_picker/abstract_result_widget.dart';

class CadenceFormField extends StatefulWidget {
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
  State<CadenceFormField> createState() => _CadenceFormFieldState();
  
}

class _CadenceFormFieldState extends State<CadenceFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // initialValue: widget.currentValue.toString(),
      onChanged: widget.onChanged,
      decoration: const InputDecoration(
        hintText: 'Turnover per minute',
        labelText: 'Cadence',
        helperText: "",
      ),
      validator: widget.validator,
      keyboardType: TextInputType.number,
    );
  }
}