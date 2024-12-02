import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/view/planner/month_day.dart';
import 'package:tri/app/view/widgets/tri_card.dart';
import 'package:tri/app/view/widgets/tri_header.dart';
import 'package:tri/app/view/workout/full_workout_view.dart';
import 'package:tri/app/view/workout/workout_list.dart';
import 'package:calendar_view/calendar_view.dart';

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
      AbstractWorkout? workout = null;
      if (dragData.data is CalendarEventData) {
        CalendarEventData calData = dragData.data as CalendarEventData;
        CalendarControllerProvider.of(context).controller.remove(calData);
        if (calData.event is AbstractWorkout) {
          workout = calData.event as AbstractWorkout;
        }
      }
      String title = "Unkown";
      if (dragData.data is AbstractWorkout) {
        workout = dragData.data as AbstractWorkout;
      }
      if (workout != null) {
        title = workout.type.title;
      }
      var event = CalendarEventData<Object>(title: title, date: date, event: workout);
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
              
                  FullWorkoutView(workout: (event.event as AbstractWorkout), removable: true,),
                  TextButton(
                    onPressed: () {
                      CalendarControllerProvider.of(context).controller.remove(event);
                      Navigator.pop(context);
                    }, 
                    child: const Text('Remove from Calendar'),
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
              cellAspectRatio: 1,
              onCellTap: addEvent,
              cellBuilder: getCell,
              onEventTap: onEventTap,
            ),
          ),
          const Expanded(
            flex: 2, 
            child: TriCard(
              padding: 0,
              child: Column(
                children: [
                  TriHeader(header: "Grab a Workout from Your List"),
                  Expanded(child: WorkoutList(placeholder: Text('Your workouts will appear here!'),)),
                ],
              )
            )
          ),
        ],
      );
 
  }
}