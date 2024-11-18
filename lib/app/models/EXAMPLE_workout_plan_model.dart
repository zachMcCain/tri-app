import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/workout_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutPlanModel extends ChangeNotifier{
  List<WorkoutModel> workouts = List.empty();

  addWorkout(WorkoutModel workout) {
    workouts.add(workout);
    notifyListeners();
  }
}

final planned_workouts = ChangeNotifierProvider<WorkoutPlanModel>((ref) => WorkoutPlanModel());