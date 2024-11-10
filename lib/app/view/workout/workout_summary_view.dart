import 'package:flutter/material.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/app/models/workout/workout_summary_visitor.dart';

class WorkoutSummaryView extends StatelessWidget {
  final AbstractWorkout workout;

  const WorkoutSummaryView({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    WorkoutSummaryVisitor summaryVisitor = WorkoutSummaryVisitor(type: workout.type);
    workout.accept(summaryVisitor);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                // summaryVisitor.summary.type.icon,
                // const SizedBox(width: 9,),
                Text(summaryVisitor.summary.type.name.toString().toUpperCase()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Planned Distance:'),
                    Text(summaryVisitor.getDistanceDisplay())
                  ],
                ),
                const SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Planned Time:'),
                    Text(summaryVisitor.getTimeDisplay())
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}