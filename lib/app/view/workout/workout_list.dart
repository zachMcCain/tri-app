import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tri/app/providers/workouts_provider.dart';
import 'package:tri/app/view/workout/workout_list_item.dart';

class WorkoutList extends ConsumerWidget {
  final Widget placeholder;

  const WorkoutList({super.key, required this.placeholder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final allWorkouts = ref.watch(workoutsProvider);

    Widget getWorkoutList() {
      if (allWorkouts.workouts.isNotEmpty) {
        return ListView(
          itemExtent: 100, 
          children: [
            ...allWorkouts.workouts.map((workout) => WorkoutListItem(workout: workout))
          ]
        );
      } else {
        return placeholder;
      }
    }

    return getWorkoutList();
  }
}