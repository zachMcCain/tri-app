import 'package:flutter/material.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';
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
        // List the segments
        Text(workout.workoutNotes ??= ''),
        ...workout.segments.map(
          (segment) {
            return SizedBox(
              width: 300,
              height: 60,
              child: Card.filled(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(segment.getDisplayValue()),
                )
              ),
            );
          } 
        )
      ],
    );
  }
}