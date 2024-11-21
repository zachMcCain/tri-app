import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:tri/app/models/workout_models/segments/abstract_segment.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
part 'brick.g.dart';

@JsonSerializable(explicitToJson: true)
class Brick extends AbstractWorkout {
  @override
  WorkoutType type = WorkoutType.brick;
  @override
  List<AbstractSegment> segments = List.empty(growable: true);


  Brick();

  @override
  accept(Visitor v) {
    segments.forEach(v.visit);
    
  }

  @override
  bool valid() {
    return segments.isEmpty ? false : true;
  }

  @override
  Function get fromJsonFunction => _$BrickFromJson;

  factory Brick.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<Brick>(json);
  
  @override
  Map<String, dynamic> toJson() => _$BrickToJson(this);
}