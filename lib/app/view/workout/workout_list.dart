import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tri/app/providers/workouts_provider.dart';
import 'package:tri/app/view/workout/full_workout_view.dart';

class WorkoutList extends ConsumerWidget {
  const WorkoutList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final allWorkouts = ref.watch(workoutsProvider);

    return Card(
      child: Column(
        children: [
          const Text('Workouts'),
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 200, 
              diameterRatio: 10,
              children: [
                ...allWorkouts.workouts.map((workout) => FullWorkoutView(workout: workout))
              ]
            ),
          )
        ],
      ),
    );
  }
}