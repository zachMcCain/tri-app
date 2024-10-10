import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
import 'package:tri/app/utils/validators.dart';
import 'package:tri/app/view/forms/custom_form_fields/start_time_form_field.dart';
import 'package:tri/app/view/forms/run_form.dart/run_form.dart';

class WorkoutForm extends StatefulWidget {

  final WorkoutType workoutType;

  const WorkoutForm({super.key, required this.workoutType});

  @override
  WorkoutFormState createState() {
    return WorkoutFormState();
  }
}

class WorkoutFormState extends State<WorkoutForm> {

  final _formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  Widget workoutView = const SizedBox.shrink();

  onSelect(value) {
    if (value == "run") {
      setState(() {
        workoutView = RunForm();
      });
    } else {
      setState(() {
        workoutView = const SizedBox.shrink();
      });
    }
    
    // Need to fill out the rest of the form with the type of excercise here
  }
  

  onSubmit() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(textController.text)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        heightFactor: 0.9,
        child: Container(
          child: Form(
            key: _formKey, // used to save, reset, and validate every child FormField
            child: ListView(
              children: [
                DropdownMenu(
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: "swim", label: "Swim"),
                    DropdownMenuEntry(value: "bike", label: "Bike"),
                    DropdownMenuEntry(value: "run", label: "Run"),
                  ],
                  onSelected: onSelect,
                  enableSearch: false,
                ),
                TextFormField(
                  validator: Validators.notEmpty,
                  decoration: InputDecoration(hintText: "Placeholder for Workout Duration"),
                  controller: textController,
                  
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Placeholder for Workout Heartrate"),
                  keyboardType: TextInputType.number,
                  validator: Validators.isNumber,
                ),
                StartTimeFormField(
                  validator: Validators.notEmpty,
                  currentValue: TimeOfDay.now(),
                  onChanged: (value) => {

                  },
                ),
                workoutView,
                ElevatedButton(
                  onPressed: onSubmit,
                  child: const Text('Submit')
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}