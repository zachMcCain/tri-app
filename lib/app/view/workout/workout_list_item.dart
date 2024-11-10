import 'package:flutter/material.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/app/view/workout/workout_summary_view.dart';

class WorkoutListItem extends StatelessWidget {
  final AbstractWorkout workout;

  const WorkoutListItem({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: WorkoutSummaryView(workout: workout)
    );
  }
}