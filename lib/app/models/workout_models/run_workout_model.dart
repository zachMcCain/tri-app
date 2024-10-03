import 'package:tri/app/models/workout_models/segment_model.dart';
import 'package:tri/app/models/workout_models/workout_model.dart';

class RunWorkoutModel extends WorkoutModel implements Segment {
  @override
  WorkoutType type = WorkoutType.run;

  Duration _duration = Duration();

  @override
  get duration => _duration;
}