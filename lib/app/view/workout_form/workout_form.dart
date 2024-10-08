import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/workout.dart';
import 'package:tri/app/view/workout_form/run_form.dart/run_form.dart';

class WorkoutForm extends StatefulWidget {
  const WorkoutForm({super.key});

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
    print("Selected $value");
    if (value == "run") {
      setState(() {
        
        workoutView = RunForm();
      });
    } else {
      setState(() {
        workoutView = SizedBox.shrink();
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
    return Form(
      key: _formKey, // used to save, reset, and validate every child FormField
      child: Column(
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Value required';
              }
              return null;
            },
            decoration: InputDecoration(hintText: "Placeholder for Workout Duration"),
            controller: textController,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Placeholder for Workout Heartrate"),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Placeholder for Workout Start Time"),
          ),
          workoutView,
          ElevatedButton(
            onPressed: onSubmit,
            child: const Text('Submit')
          )
        ],
      )
    );
  }
}