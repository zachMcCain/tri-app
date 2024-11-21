import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/models/workout_models/bike.dart';
import 'package:tri/app/models/workout_models/brick.dart';
import 'package:tri/app/models/workout_models/custom.dart';
import 'package:tri/app/models/workout_models/run.dart';
import 'package:tri/app/models/workout_models/strength.dart';
import 'package:tri/app/models/workout_models/swim.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';

class WorkoutFactory {
  AbstractWorkout create(WorkoutType type) {
    if (type == WorkoutType.run) {
      return Run();
    } else if (type == WorkoutType.swim) {
      return Swim();
    } else if (type == WorkoutType.bike) {
      return Bike();
    } else if (type == WorkoutType.custom) {
      return Custom();
    } else if (type == WorkoutType.strength) {
      return Strength();
    } else if (type == WorkoutType.brick) {
      return Brick();
    } else {
      return Run();
    }
  }
}