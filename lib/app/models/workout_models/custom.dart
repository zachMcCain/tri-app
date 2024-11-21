import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:tri/app/models/workout_models/segments/abstract_segment.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
part 'custom.g.dart';

@JsonSerializable(explicitToJson: true)
class Custom extends AbstractWorkout {
  @override
  WorkoutType type = WorkoutType.custom;
  @override
  List<AbstractSegment> segments = List.empty(growable: true);


  Custom();

  @override
  accept(Visitor v) {
    segments.forEach(v.visit);
    
  }

  @override
  bool valid() {
    return segments.isEmpty ? false : true;
  }

  @override
  Function get fromJsonFunction => _$CustomFromJson;

  factory Custom.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<Custom>(json);
  
  @override
  Map<String, dynamic> toJson() => _$CustomToJson(this);
}