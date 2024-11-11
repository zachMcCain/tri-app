import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
import 'package:tri/app/view/forms/forms/bike_form.dart';
import 'package:tri/app/view/forms/forms/run_form.dart';
import 'package:tri/app/view/forms/forms/swim_form.dart';

class WorkoutFormFactory {
  Widget getWorkoutForm(WorkoutType type, ValueChanged<Object> onChanged) {
    if (type == WorkoutType.run) {
      return RunForm(onChanged: onChanged,);
    } else if (type == WorkoutType.swim) {
      return SwimForm(onChanged: onChanged,);
    } else if (type == WorkoutType.bike) {
      return BikeForm(onChanged: onChanged,);
    } else {
      return RunForm(onChanged: onChanged,);
    }
  }
}