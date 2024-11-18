import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/pace.dart';
import 'package:tri/app/view/forms/custom_form_fields/pace_form_field.dart';

part 'workout_duration.g.dart';

@JsonSerializable(explicitToJson: true)
class WorkoutDuration extends AbstractSegment {
  Duration duration = const Duration();
  DistanceUnit units = DistanceUnit.mi;
  Pace? pace;
  PaceMode paceMode = PaceMode.mpm;

  WorkoutDuration();

  @override
  String getDisplayValue() {
    return '${getDisplayHours()} ${getDisplayMinutes()} ${getDisplaySeconds()}'.trim();
  }

  String getDisplayHours() {
    if (duration.inHours >= 1) {
      return '${duration.inHours % 24} hr';
    } else {
      return '';
    }
  }
  
  String getDisplayMinutes() {
    if (duration.inMinutes >= 1) {
      return '${duration.inMinutes % 60} min';
    } else {
      return '';
    }
  }

  String getDisplaySeconds() {
    if (duration.inSeconds % 60 >= 1) {
      return '${duration.inSeconds % 60} s';
    } else {
      return '';
    }
  }

  String getPaceDisplay() {
    if (pace == null) {
      return '';
    } else if (paceMode == PaceMode.mpm) {
      return '${pace!.time.inMinutes}\' ${(pace!.time.inSeconds % 60).toString().padRight(2, '0')}" / ${units.name}';
    } else if (paceMode == PaceMode.meters) {
      return '${pace!.time.inMinutes}:${(pace!.time.inSeconds % 60).toString().padRight(2, '0')} / 25 m';
    } else {
      return '${pace!.distance} ${paceMode.name}';
    }
  }

  @override
  Function get fromJsonFunction => _$WorkoutDurationFromJson;

  factory WorkoutDuration.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<WorkoutDuration>(json);

  @override
  Map<String, dynamic> toJson() => _$WorkoutDurationToJson(this);
}