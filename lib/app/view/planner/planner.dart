import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/view/planner/month_day.dart';
import 'package:tri/app/view/workout/workout_list.dart';
import 'package:calendar_view/calendar_view.dart';

class Planner extends StatelessWidget {
  const Planner({super.key});



  @override
  Widget build(BuildContext context) {
    
    void addEvent(events, date) {
      print("Adding an event!");
      // final event = CalendarEventData<Object>(title: "My Event!", date: date);
      // CalendarControllerProvider.of(context).controller.add(event);
    }

    void addWorkout(DragTargetDetails<Object> workout, date) {
      print("Adding a workout yo $workout on date $date");
      String title = "Unkown";
      if (workout.data is AbstractWorkout) {
        title = (workout.data as AbstractWorkout).type.title;
      }
      var event = CalendarEventData<Object>(title: title, date: date, event: workout.data);
      CalendarControllerProvider.of(context).controller.add(event);
    }

    Widget getCell(DateTime date, List<CalendarEventData<Object?>> events, bool isToday, bool isInMonth, bool idunno) {
      return MonthDay(date: date, events: events, isToday: isToday, isInMonth: isInMonth, onDrop: addWorkout,);
    }

    void onEventTap(CalendarEventData<Object?> event, DateTime date) {
      print("Tapped on my event: $event");
    }

    return Column(
        children: [
          Expanded(
            child: MonthView(
              cellAspectRatio: 1,
              onCellTap: addEvent,
              cellBuilder: getCell,
              onEventTap: onEventTap,
              
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