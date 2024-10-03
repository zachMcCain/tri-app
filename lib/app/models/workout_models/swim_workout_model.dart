import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/segment_model.dart';
import 'package:tri/app/models/workout_models/workout_model.dart';

class SwimWorkoutModel extends ChangeNotifier implements Segment {
  @override
  WorkoutType type = WorkoutType.swim;

  @override
  // TODO: implement duration
  get duration => throw UnimplementedError();

  get time => throw UnimplementedError();
}