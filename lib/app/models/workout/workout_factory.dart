import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/app/models/workout/run.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';

class WorkoutFactory {
  AbstractWorkout create(WorkoutType type) {
    if (type == WorkoutType.run) {
      return Run();
    } else {
      return Run();
    }
  }
}