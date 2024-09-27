import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tri/app/models/workout_bank_model.dart';

/// This is just a placeholder for the idea of having a cascading stack - perhaps Stack is not the best class for this as it just straight up stacks them
class WorkoutStack extends ConsumerWidget {
  const WorkoutStack({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WorkoutBankModel workouts = ref.watch(planned_workouts);

    return const Stack(
      children: [
        Card.filled(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text("Workout Number 1")
          ),
        ),
        Positioned(
          top: 15,
          left: 15,
          child: Card.filled(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text("Workout Number 2")
            ),
          )
        )
      ]
    );
  }
}