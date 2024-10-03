import 'package:flutter/material.dart';

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