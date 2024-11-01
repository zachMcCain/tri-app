import 'package:flutter/material.dart';
import 'package:tri/app/models/workout/distance.dart';
import 'package:tri/app/models/workout/pace.dart';

class DistanceFormField extends StatefulWidget {
  final ValueChanged<Distance> onChanged;
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
  Distance distance = Distance();

  void setDistance(String dist) {
    distance.distance = double.tryParse(dist.replaceAll(",", "")) ?? 0;
    widget.onChanged(distance);
  }

  void setPace(Pace pace) {
    distance.pace = pace;
    widget.onChanged(distance);
  }

  // Need a Distance model that we are returning


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        // initialValue: widget.currentValue.toString(),
        onChanged: setDistance,
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