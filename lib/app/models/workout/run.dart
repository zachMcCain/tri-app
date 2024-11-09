import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';

class Run extends AbstractWorkout {
  @override
  WorkoutType type = WorkoutType.run;

  @override
  accept(Visitor v) {
    segments.forEach(v.visit);
    
  }

  @override
  bool valid() {
    return segments.isEmpty ? false : true;
  }
}