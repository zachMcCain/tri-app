import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/view/workout/workout_segment_list.dart';
import 'package:tri/app/view/workout/workout_summary_view.dart';

class FullWorkoutView extends StatelessWidget {
  final AbstractWorkout workout;
  final bool removable;

  const FullWorkoutView({super.key, required this.workout, this.removable = false});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        // Provide a summary at the top
        WorkoutSummaryView(workout: workout),
        const SizedBox(height: 5,),
        WorkoutSegmentList(workout: workout, removable: removable,)
      ],
    );
  }
}