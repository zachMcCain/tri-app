import 'package:flutter/material.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/app/view/workout/workout_segment_list.dart';
import 'package:tri/app/view/workout/workout_summary_view.dart';

class FullWorkoutView extends StatelessWidget {
  final AbstractWorkout workout;

  const FullWorkoutView({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        // Provide a summary at the top
        WorkoutSummaryView(workout: workout),
        const Divider(),
        WorkoutSegmentList(workout: workout)
      ],
    );
  }
}