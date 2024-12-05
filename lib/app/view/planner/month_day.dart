import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';

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
        return Colors.green.shade800;
      } else if (workout.type == WorkoutType.bike) {
        return Colors.amber.shade900;
      } else if (workout.type == WorkoutType.swim) {
        return Colors.blue.shade800;
      } else if (workout.type == WorkoutType.brick) {
        return Colors.red.shade200;
      }
      return Colors.green.shade900;
    }
    
    bool dragging = false;
    Widget getListItem(CalendarEventData<Object?> data) {


      if (data.event is AbstractWorkout) {
        AbstractWorkout workout = data.event as AbstractWorkout;
        Icon icon = Icon(workout.type.icon, size: 12,);
        Color eventColor = getEventColor(workout);

        
        return Listener(
          onPointerUp:(event) {
            if (!dragging) {
              onTap(data, date);
            }
          },
          child: LongPressDraggable(
            data: data, // this doesn't like being set to data
            feedback: WorkoutCalendarEvent(eventColor: eventColor, icon: icon, workout: workout),
            onDragStarted: () {
              dragging = true; 
            },
            onDragCompleted: () {
              dragging = false;
            },
            child: WorkoutCalendarEvent(eventColor: eventColor, icon: icon, workout: workout),
          ),
        );
      } else {
        return const Text("Some Event");
      }
    }

    return DragTarget<Object>(
      builder: (context, candidateItems, rejectedItems) {
        

        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: isInMonth ? Theme.of(context).inputDecorationTheme.fillColor : null
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

class WorkoutCalendarEvent extends StatelessWidget {
  const WorkoutCalendarEvent({
    super.key,
    required this.eventColor,
    required this.icon,
    required this.workout,
  });

  final Color eventColor;
  final Icon icon;
  final AbstractWorkout workout;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}