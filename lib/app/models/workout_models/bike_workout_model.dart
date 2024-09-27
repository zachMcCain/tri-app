
import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/segment_model.dart';
import 'package:tri/app/models/workout_models/workout_model.dart';

class BikeWorkoutModel extends ChangeNotifier implements Segment {
  @override
  WorkoutType type = WorkoutType.bike;

  Duration _duration = const Duration();

  @override
  Duration get duration => _duration;

  set duration(Duration duration) {
    _duration = duration;
    notifyListeners();
  }
}