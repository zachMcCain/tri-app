import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/providers/workouts_provider.dart';
import 'package:tri/app/view/workout/workout_list_item.dart';

class WorkoutList extends ConsumerWidget {
  final Widget placeholder;

  const WorkoutList({super.key, required this.placeholder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final allWorkouts = ref.watch(workoutsProvider);

    Widget getDragableWorkouts(AbstractWorkout workout) {
      return LongPressDraggable(
        data: workout,
        feedback: Container(
          height: 100,
          width: 350,
          child: WorkoutListItem(workout: workout)
        ),
        child: WorkoutListItem(workout: workout), 
      );
    }

    Widget getWorkoutList() {
      if (allWorkouts.workouts.isNotEmpty) {
        return ListView(
          itemExtent: 100, 
          children: [
            ...allWorkouts.workouts.map(getDragableWorkouts)
          ]
        );
      } else {
        return placeholder;
      }
    }

    return getWorkoutList();
  }
}