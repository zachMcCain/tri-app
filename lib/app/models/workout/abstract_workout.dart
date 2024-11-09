import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
import 'package:uuid/uuid.dart';

abstract class AbstractWorkout {
  final String _id = const Uuid().v1();
  final List<AbstractSegment> segments = List.empty(growable: true);
  abstract WorkoutType type;
  String? workoutNotes;
  accept(Visitor v);
  bool valid();
}