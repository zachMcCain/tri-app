import 'package:flutter/material.dart';
import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout/distance.dart';
import 'package:tri/app/models/workout/pace.dart';
import 'package:tri/app/view/forms/custom_form_fields/pace_form_field.dart';
import 'package:tri/app/view/widgets/tri_text_input.dart';

class DistanceFormField extends StatefulWidget {
  final ValueChanged<Distance> onChanged;
  final FormFieldValidator<String>? validator;

  const DistanceFormField({
    super.key,
    required this.onChanged,
    required this.validator,
  });

  @override
  State<DistanceFormField> createState() => _DistanceFormFieldState();
}

class _DistanceFormFieldState extends State<DistanceFormField> {
  Distance distance = Distance();

  void setDistance(String dist) {
    setState(() {
      distance.distance = double.tryParse(dist.replaceAll(",", "")) ?? 0;
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
        child: const Text('Add Pace Target')
      );
    }
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
            SizedBox(
              width: 200,
              child: TriTextInput(onChanged: setDistance, hintText: distance.units.name, maxLines: 1,),
            ),
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