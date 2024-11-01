import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';

class Run extends AbstractWorkout {
  @override
  accept(Visitor v) {
    print("Calling accept on teh visitor in run workout");
    segments.forEach(v.visit);
  }
}