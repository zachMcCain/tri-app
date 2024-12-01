import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:tri/app/models/workout/workout_summary_visitor.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/view/widgets/tri_card.dart';
import 'package:tri/app/view/widgets/tri_header.dart';

class TriSummary extends StatelessWidget {
  const TriSummary({super.key});

  Summary comingWeeksSummary(BuildContext context) {
    DateTime date = DateTime.now();
    List<CalendarEventData> data = [];
    // Get all the events on the days leading up to today
    while (date.isBefore(DateTime.now().add(Duration(days: 7)))) {
      data.addAll(CalendarControllerProvider.of(context).controller.getEventsOnDay(date));
      date = date.add(const Duration(days:1));
    }
    data.retainWhere((eventData) => eventData.event is AbstractWorkout);
    List<AbstractWorkout> workouts = data.map((data) => data.event).cast<AbstractWorkout>().toList();
    return summarize(workouts);
  }


  Summary lastWeeksSummary(BuildContext context) {
    DateTime date = DateTime.now().subtract(const Duration(days: 7));
    List<CalendarEventData> data = [];
    // Get all the events on the days leading up to today
    while (date.isBefore(DateTime.now())) {
      data.addAll(CalendarControllerProvider.of(context).controller.getEventsOnDay(date));
      date = date.add(const Duration(days:1));
    }
    data.retainWhere((eventData) => eventData.event is AbstractWorkout);
    List<AbstractWorkout> workouts = data.map((data) => data.event).cast<AbstractWorkout>().toList();
    return summarize(workouts);
  }

  Summary summarize(List<AbstractWorkout> workouts) {
    Summary summary = Summary();
    for (var workout in workouts) {
      WorkoutSummaryVisitor visitor = WorkoutSummaryVisitor(type: workout.type);
      workout.accept(visitor);
      summary.distance += visitor.totalDistance?.distance ?? 0;
      summary.time += visitor.totalDuration ?? Duration.zero;
    }
    summary.activityCount = workouts.length;
    
    return summary;
  }

  String formatDuration(Duration duration) {
    // duration
    int hours = duration.inHours;
    int minutes = duration.inMinutes % 60;

    return '${hours}h ${minutes}m';
  }
  
  @override
  Widget build(BuildContext context) {
    Summary lastWeeksSummary = this.lastWeeksSummary(context);
    Summary thisWeeksSummary = comingWeeksSummary(context);

    return SizedBox(
      height: 175,
      child: TriCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TriHeader(header: "Activity Summary"),
                ],
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Upcoming Totals")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Activities: ${thisWeeksSummary.activityCount.toString()}'),
                  Text('Time: ${formatDuration(thisWeeksSummary.time)}'),
                  Text('Distance: ${thisWeeksSummary.distance.toString()} mi'),
                ],
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Last Week's Totals"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Activities: ${lastWeeksSummary.activityCount.toString()}'),
                  Text('Time: ${formatDuration(lastWeeksSummary.time)}'),
                  Text('Distance: ${lastWeeksSummary.distance.toString()} mi'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Summary {
  double distance = 0;
  Duration time = Duration.zero;
  int activityCount = 0;
}