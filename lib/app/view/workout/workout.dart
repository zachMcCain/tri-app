import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_bank_model.dart';
import 'package:tri/app/models/workout_models/run_workout_model.dart';
import 'package:tri/app/models/workout_models/workout_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Workout extends StatelessWidget {

  const Workout({super.key});
  
  @override
  Widget build(context) {

    return Center(
        child: Container(
          padding: EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    Title(color: Theme.of(context).colorScheme.primary, child: Text("Workout")),
                    WorkoutForm()
                  ],
                ),
              ),),
            ],
          ),
        )
    );
  }

}

class WorkoutForm extends ConsumerWidget {
  const WorkoutForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    WorkoutBankModel workouts = ref.watch(planned_workouts);

    return Container(
      padding: EdgeInsets.all(8),
      height: 600,
      width: 800,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      color: Colors.grey.shade300
      ),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 200, child: CupertinoTextFormFieldRow(prefix: const Text("Distance"), placeholder: "Enter distance", textAlign: TextAlign.end,)),
                const VerticalDivider(width: 20.0, thickness: 20.0, color: Colors.black,),
                CupertinoTimerPicker( onTimerDurationChanged: (value) => print('Changed $value'),),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 400, child: CupertinoTextFormFieldRow(prefix: const Text("Details"), placeholder: "Enter details", textAlign: TextAlign.end,)),
              ],
            ),
            CupertinoButton(
              child: Text("Add Workout"), 
              onPressed: () => workouts.addWorkout(RunWorkoutModel())
            )
          ],
        ),
        onChanged: () => print("The form changed yo"),
      ),
    );
  }
}

