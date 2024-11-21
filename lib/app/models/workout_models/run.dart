import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:tri/app/models/workout_models/segments/abstract_segment.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
part 'run.g.dart';

@JsonSerializable(explicitToJson: true)
class Run extends AbstractWorkout {
  @override
  WorkoutType type = WorkoutType.run;
  @override
  List<AbstractSegment> segments = List.empty(growable: true);


  Run();

  @override
  accept(Visitor v) {
    segments.forEach(v.visit);
    
  }

  @override
  bool valid() {
    return segments.isEmpty ? false : true;
  }

  @override
  Function get fromJsonFunction => _$RunFromJson;

  factory Run.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<Run>(json);
  
  @override
  Map<String, dynamic> toJson() => _$RunToJson(this);
}