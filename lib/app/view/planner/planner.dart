import 'package:flutter/material.dart';
import 'package:tri/app/view/workout/workout_list.dart';
import 'package:calendar_view/calendar_view.dart';

class Planner extends StatelessWidget {
  const Planner({super.key});



  @override
  Widget build(BuildContext context) {
    
    void addEvent(events, date) {
      print("Adding an event!");
      final event = CalendarEventData(title: "My Event!", date: date);
      CalendarControllerProvider.of(context).controller.add(event);
    }

    return Column(
        children: [
          Expanded(
            child: MonthView(
              cellAspectRatio: 1,
              onCellTap: addEvent,
            ),
          ),
          // Material(
          //   child: CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2050), 
          //     onDateChanged: (change) => print("Hi"))
          // ),
          Expanded(child: WorkoutList(placeholder: Text('Your workouts will appear here!'),)),
        ],
      );
 
  }
}