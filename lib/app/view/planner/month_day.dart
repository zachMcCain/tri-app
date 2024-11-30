import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
import 'package:tri/app/view/workout/workout_list_item.dart';

class MonthDay extends StatelessWidget {
  final DateTime date;
  final List<CalendarEventData<Object?>> events;
  final void Function(DragTargetDetails<Object>, DateTime)? onDrop;
  final bool isInMonth;
  final bool isToday;
  final void Function(CalendarEventData<Object?> event, DateTime date) onTap;

  const MonthDay({super.key, required this.date, required this.isToday, required this.isInMonth, required this.events, required this.onTap, this.onDrop});

  @override
  Widget build(BuildContext context) {

    void onTargetDrop(DragTargetDetails<Object> details) {
      if (onDrop != null) {

        onDrop!(details, date);
      }
    }

    Color getEventColor(AbstractWorkout workout) {
      if (workout.type == WorkoutType.run) {
        return Colors.green.shade300;
      } else if (workout.type == WorkoutType.bike) {
        return Colors.amber.shade600;
      } else if (workout.type == WorkoutType.swim) {
        return Colors.blue.shade300;
      } else if (workout.type == WorkoutType.brick) {
        return Colors.red.shade200;
      }
      return Colors.green.shade300;
    }
    
    Widget getListItem(CalendarEventData<Object?> data) {
      if (data.event is AbstractWorkout) {
        AbstractWorkout workout = data.event as AbstractWorkout;
        Icon icon = Icon(workout.type.icon, size: 12,);
        Color eventColor = getEventColor(workout);
        return Listener(
          onPointerDown:(event) => onTap(data, date),
          child: Container(
            decoration: BoxDecoration(
              color: eventColor 
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text(
                    workout.name ?? workout.type.title,
                    style: const TextStyle(fontSize: 10,)
                  ),
                )
              ],
            ),
          ),
        );
      } else {
        return const Text("Some Event");
      }
    }

    return DragTarget<AbstractWorkout>(
      builder: (context, candidateItems, rejectedItems) {
        

        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: isInMonth ? Colors.white : null
          ),
          child: Column(
            children: [
              isToday ? 
                CircleAvatar(
                  radius: 13, 
                  backgroundColor: Colors.blue.shade400,
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12)
                  ),
                ) : 
                Text(date.day.toString(), style: TextStyle(color: Colors.grey[600], fontSize: 12),),
              ...events.map((event) => getListItem(event))
            ],
          ),
        );
      },
      onAcceptWithDetails: onTargetDrop,
    );
  }
}