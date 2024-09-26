import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/run_workout_model.dart';

abstract class WorkoutModel extends ChangeNotifier {
  DateTime time = DateTime.now();
  WorkoutType type = WorkoutType.other;


  update() {
    notifyListeners();
  }
}

enum WorkoutType {
  run,
  bike,
  swim,
  strength,
  other,
}