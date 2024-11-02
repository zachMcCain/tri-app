import 'package:flutter/material.dart';
import 'package:tri/app/view/workout/workout_list.dart';

class Planner extends StatelessWidget {
  const Planner({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Material(
        child: CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2050), 
        onDateChanged: (change) => print("Hi"))),
        const Expanded(child: WorkoutList()),
      ],
    );
 
  }
}