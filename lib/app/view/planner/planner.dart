import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/view/planner/month_day.dart';
import 'package:tri/app/view/workout/workout_list.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:tri/app/view/workout/workout_summary_view.dart';

class Planner extends StatelessWidget {
  const Planner({super.key});



  @override
  Widget build(BuildContext context) {
    
    void addEvent(events, date) {
      print("Adding an event! Current events: $events");
      
      // final event = CalendarEventData<Object>(title: "My Event!", date: date);
      // CalendarControllerProvider.of(context).controller.add(event);
    }

    void addWorkout(DragTargetDetails<Object> dragData, date) {
      print("Adding a workout yo $dragData on date $date");
      String title = "Unkown";
      if (dragData.data is AbstractWorkout) {
        title = (dragData.data as AbstractWorkout).type.title;
      }
      var event = CalendarEventData<Object>(title: title, date: date, event: dragData.data);
      CalendarControllerProvider.of(context).controller.add(event);
    }

    void onEventTap(CalendarEventData<Object?> event, DateTime date) {
      if (event.event is AbstractWorkout) {
        showDialog(
          context: context, 
          builder:(context) => Dialog(child: 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
                  WorkoutSummaryView(workout: (event.event as AbstractWorkout)),
                  TextButton(
                    onPressed: () {
                      CalendarControllerProvider.of(context).controller.remove(event);
                      Navigator.pop(context);
                    }, 
                    child: const Text('Remove'),
                  )
                ],
              ),
            )
          ),
        );
      }
      print("Tapped on my event: $event");
    }
  
    Widget getCell(DateTime date, List<CalendarEventData<Object?>> events, bool isToday, bool isInMonth, bool idunno) {
      return MonthDay(date: date, events: events, isToday: isToday, isInMonth: isInMonth, onTap: onEventTap, onDrop: addWorkout,);
    }


    return Column(
        children: [
          Expanded(
            flex: 3,
            child: MonthView(
              cellAspectRatio: 0.8,
              onCellTap: addEvent,
              cellBuilder: getCell,
              onEventTap: onEventTap,
            ),
          ),
          const Expanded(flex: 2, child: WorkoutList(placeholder: Text('Your workouts will appear here!'),)),
        ],
      );
 
  }
}