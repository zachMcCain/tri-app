import 'package:flutter/material.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/app/models/workout/workout_summary_visitor.dart';
import 'package:tri/app/view/workout/workout_summary_view.dart';

class FullWorkoutView extends StatelessWidget {
  final AbstractWorkout workout;

  const FullWorkoutView({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    WorkoutSummaryVisitor summaryVisitor = WorkoutSummaryVisitor();
    workout.accept(summaryVisitor);

    print("Building a summar view from a summary with distance: ${summaryVisitor.summary.totalDistance}");

    return Column(
      children: [
        WorkoutSummaryView(summary: summaryVisitor.summary),
        Text(workout.workoutNotes ??= ''),
        ...workout.segments.map((segment) => Text(segment.getDisplayValue()))
      ],
    );
  }
}