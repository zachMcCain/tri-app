import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout/distance.dart';
import 'package:tri/app/models/workout/pace.dart';
import 'package:tri/app/view/forms/custom_form_fields/pace_form_field.dart';
import 'package:tri/app/view/widgets/tri_text_input.dart';

class DistanceFormField extends StatefulWidget {
  final ValueChanged<Distance> onChanged;
  final FormFieldValidator<String>? validator;
  final Distance? currentValue;

  const DistanceFormField({
    super.key,
    required this.onChanged,
    this.validator,
    this.currentValue,
  });

  @override
  State<DistanceFormField> createState() => _DistanceFormFieldState();
}

class _DistanceFormFieldState extends State<DistanceFormField> {
  Distance distance = Distance();

  void setDistance(double dist) {
    setState(() {
      distance.distance = dist;
    });
  }

  void setPace(Pace pace) {
    setState(() {
      distance.pace = pace;
    });
  }

  Widget getPaceOrButton() {
    if (distance.pace != null) {
      return Column(
        children: [
          const Text('Target Pace:'),
          Text(distance.getPaceDisplay())
        ],
      );
    } else {
      return TextButton(
        onPressed: () {
          showDialog(context: context, 
            builder: (context) => Dialog(
              child: PaceFormField(
                onChanged: setPace, 
                unit: DistanceUnit.mi
              ),
            )
          );
        }, 
        child: const Text('Set Pace Target')
      );
    }
  }

  Widget getDistanceOrEditor() {
    return TextButton(
      onPressed: onDistanceEdit, 
      child: Text(distance.distance > 0 ? distance.getDistanceDisplay() : 'Add Target Distance')
    );
  }

  void onDistanceEdit() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, stateSetter) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: DecimalNumberPicker(
                        minValue: 0, 
                        maxValue: 200, 
                        decimalPlaces: 2,
                        value: distance.distance,
                        decimalTextMapper: (text) => '. ${text.padLeft(2, '0')} ${distance.units.name}',
                        onChanged: (value) { 
                          stateSetter(() {
                            setDistance(value);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                TextButton(onPressed: () => {Navigator.pop(context)}, child: const Text('Submit'))
              ],
            )
              );
        }
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white70,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getDistanceOrEditor(),
            getPaceOrButton(),
            IconButton(
              onPressed: () {
                widget.onChanged(distance);
                setState(() {
                  
                  distance = Distance();
                });
              }, 
              icon: const Icon(Icons.add)
            )
          ],
        ),
      ),
    );
  }

}