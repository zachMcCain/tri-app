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
    distance.distance = double.tryParse(dist.replaceAll(",", "")) ?? 0;
    print('calling setdistance with a distance of ${distance.distance}');
    // widget.onChanged(distance);
  }

  void setPace(Pace pace) {
    distance.pace = pace;
    // widget.onChanged(distance);
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
        child: const Text('Add Pace')
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Column(
  //       children: [
  //         AppBar(
  //           title: const Text('TRI'),
  //           backgroundColor: Theme.of(context).colorScheme.primary,
  //         ),
  //         TextFormField(
  //           onChanged: setDistance,
  //           decoration: const InputDecoration(
  //             hintText: '3.1',
  //             labelText: 'Distance',
  //             helperText: "",
  //             suffixText: "miles"
  //           ),
  //           validator: widget.validator,
  //           keyboardType: TextInputType.number,
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             showDialog(context: context, 
  //               builder: (context) => PaceFormField(
  //                 onChanged: setPace, 
  //                 unit: DistanceUnit.mi
  //               )
  //             );
  //           }, 
  //           child: const Text('Add Pace')
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             // Make sure the model is up to date
  //             widget.onChanged(distance);
  //             // Pass the model out to the level above
  //             Navigator.pop(context, distance);
  //           }, 
  //           child: const Text('Submit')
  //         )
  //       ],
  //     ),
  //   );
  // }

}