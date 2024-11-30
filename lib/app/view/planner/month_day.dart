import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/view/workout/workout_list_item.dart';

class MonthDay extends StatelessWidget {
  final DateTime date;
  final List<CalendarEventData<Object?>> events;
  final void Function(DragTargetDetails<Object>, DateTime)? onDrop;
  final bool isInMonth;
  final bool isToday;

  const MonthDay({super.key, required this.date, required this.isToday, required this.isInMonth, required this.events, this.onDrop});

  @override
  Widget build(BuildContext context) {

    void onTargetDrop(DragTargetDetails<Object> details) {
      if (onDrop != null) {

        onDrop!(details, date);
      }
    }
    
    Widget getListItem(CalendarEventData<Object?> data) {
      if (data.event is AbstractWorkout) {
        Icon icon = Icon((data.event as AbstractWorkout).type.icon, size: 12,);
        return Row(
          children: [
            icon,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Text(
                (data.event as AbstractWorkout).name ?? (data.event as AbstractWorkout).type.title,
                style: const TextStyle(fontSize: 10,)
              ),
            )
          ],
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