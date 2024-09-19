import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri/app/models/workout_model.dart';

class Workout extends StatelessWidget{

  const Workout({super.key});
  
  @override
  Widget build(context) {
    return Consumer<WorkoutModel>(
      builder: (context, workout, child) => Center(
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
                    WorkoutForm(workoutModel: WorkoutModel(),)
                  ],
                ),
              ),),
            ],
          ),
        )
      )
    );
  }

}

class WorkoutForm extends StatelessWidget {
  const WorkoutForm({
    super.key, required this.workoutModel
  });

  final WorkoutModel workoutModel;

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 200, child: CupertinoTextFormFieldRow(prefix: const Text("Distance"), placeholder: "Enter text", textAlign: TextAlign.end,)),
            VerticalDivider(width: 20.0, thickness: 20.0, color: Colors.black,),
            SizedBox(width: 200, child: CupertinoTextFormFieldRow(prefix: const Text("Time"), placeholder: "Enter text", textAlign: TextAlign.end,)),
          ],
        ),
      ],),
      onChanged: () => print("The form changed yo"),
    );
  }
}

