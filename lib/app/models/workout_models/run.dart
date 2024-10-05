import 'package:tri/app/models/workout_models/workout.dart';

class Run extends Workout {
  Run(super.duration, super.heartRate, super.startTime,) { 
    label = 'Run';
  }

}