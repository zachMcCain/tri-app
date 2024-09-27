import 'package:tri/app/models/workout_models/workout_model.dart';

abstract class Segment {
  get type => WorkoutType;

  get duration => Duration;
}