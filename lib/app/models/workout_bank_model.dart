import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/workout_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutBankModel extends ChangeNotifier{
  List<WorkoutModel> workouts = List.empty(growable: true);

  addWorkout(WorkoutModel workout) {
    print("Added a workout, the list is now of size ${workouts.length}");
    workouts.add(workout);
    notifyListeners();
  }
}

final planned_workouts = ChangeNotifierProvider<WorkoutBankModel>((ref) => WorkoutBankModel());
