import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/view/widgets/tri_card.dart';
import 'package:tri/app/view/workout/workout_summary_view.dart';

class WorkoutListItem extends StatelessWidget {
  final AbstractWorkout workout;
  final bool removable;

  const WorkoutListItem({super.key, required this.workout, this.removable = false});

  @override
  Widget build(BuildContext context) {
    return TriCard(
      padding: 0,
      child: WorkoutSummaryView(workout: workout, removable: removable,)
    );
  }
}