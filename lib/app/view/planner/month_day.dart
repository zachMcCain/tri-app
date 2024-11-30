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

  MonthDay({super.key, required this.date, required this.isToday, required this.isInMonth, required this.events, this.onDrop});

  @override
  Widget build(BuildContext context) {

    void _onDrop(DragTargetDetails<Object> details) {
      if (onDrop != null) {

        onDrop!(details, date);
      }
    }
    
    Widget getListItem(CalendarEventData<Object?> data) {
      if (data.event is AbstractWorkout) {
        Icon icon = (data.event as AbstractWorkout).type.icon;
        return Row(
          children: [
            icon,
            Text((data.event as AbstractWorkout).name ?? (data.event as AbstractWorkout).type.title),
          ],
        );
      } else {
        return Text("Some Event");
      }
    }


    // TODO: implement build
    return DragTarget<AbstractWorkout>(
      builder: (context, candidateItems, rejectedItems) {
        

        return Container(
          decoration: BoxDecoration(
            color: isInMonth ? Colors.white70 : null
          ),
          child: Column(
            children: [
              Text(date.day.toString()),
              ...events.map((event) => getListItem(event))
            ],
          ),
        );
      },
      onAcceptWithDetails: _onDrop,
    );
  }
}