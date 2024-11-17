import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
part 'swim.g.dart';

@JsonSerializable(explicitToJson: true)
class Swim extends AbstractWorkout {
  @override
  WorkoutType type = WorkoutType.swim;
  @override
  List<AbstractSegment> segments = List.empty(growable: true);


  Swim();

  @override
  accept(Visitor v) {
    segments.forEach(v.visit);
    
  }

  @override
  bool valid() {
    return segments.isEmpty ? false : true;
  }

  @override
  Function get fromJsonFunction => _$SwimFromJson;

  factory Swim.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<Swim>(json);
  
  @override
  Map<String, dynamic> toJson() => _$SwimToJson(this);
}