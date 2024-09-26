import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/segment_model.dart';
import 'package:tri/app/models/workout_models/workout_model.dart';

class RunWorkoutModel extends ChangeNotifier implements Segment {
  @override
  WorkoutType type = WorkoutType.run;


}