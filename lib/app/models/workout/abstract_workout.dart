import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
import 'package:uuid/uuid.dart' as uuid;

part 'abstract_workout.g.dart';

@JsonSerializable(explicitToJson: true)
class AbstractWorkout extends Serializable {
  final String _id = const uuid.Uuid().v1();
  final List<AbstractSegment> segments = List.empty(growable: true);
  final WorkoutType type = WorkoutType.custom;
  String? workoutNotes;
  void accept(Visitor v) => {};
  bool valid() => true;

  AbstractWorkout();

  get id => _id;

  @override
  Map<String, dynamic> toJson() => _$AbstractWorkoutToJson(this);
  
  factory AbstractWorkout.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<AbstractWorkout>(json);

  @override
  Function get fromJsonFunction => _$AbstractWorkoutFromJson;

}
