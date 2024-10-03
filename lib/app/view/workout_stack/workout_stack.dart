import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tri/app/models/workout_bank_model.dart';

/// This is just a placeholder for the idea of having a cascading stack - perhaps Stack is not the best class for this as it just straight up stacks them
class WorkoutStack extends ConsumerWidget {
  const WorkoutStack({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WorkoutBankModel workouts = ref.watch(planned_workouts);

    List<Widget> cards = workouts.workouts.map((workout) => Card.filled(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(workout.toString())
          ),
        ),
      ).toList();

    return Stack(
      children: cards
    );
  }
}