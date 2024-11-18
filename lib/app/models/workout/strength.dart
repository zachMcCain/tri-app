import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';

part 'strength.g.dart';

@JsonSerializable(explicitToJson: true)
class Strength extends AbstractWorkout {
  @override
  WorkoutType type = WorkoutType.strength;
  @override
  List<AbstractSegment> segments = List.empty(growable: true);


  Strength();

  @override
  accept(Visitor v) {
    segments.forEach(v.visit);
    
  }

  @override
  bool valid() {
    return segments.isEmpty ? false : true;
  }

  @override
  Function get fromJsonFunction => _$StrengthFromJson;

  factory Strength.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<Strength>(json);
  
  @override
  Map<String, dynamic> toJson() => _$StrengthToJson(this);
}