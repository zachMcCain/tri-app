import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/app/models/workout/bike.dart';
import 'package:tri/app/models/workout/brick.dart';
import 'package:tri/app/models/workout/custom.dart';
import 'package:tri/app/models/workout/run.dart';
import 'package:tri/app/models/workout/strength.dart';
import 'package:tri/app/models/workout/swim.dart';
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