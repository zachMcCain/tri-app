import 'package:carp_serializable/carp_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout_models/segments/abstract_segment.dart';
import 'package:tri/app/models/workout_models/targets/pace.dart';
import 'package:tri/app/view/forms/custom_form_fields/pace_form_field.dart';

part 'distance.g.dart';

@JsonSerializable(explicitToJson: true)
class Distance extends AbstractSegment {
  DistanceUnit units = DistanceUnit.mi;
  double distance = 0.0;
  Pace? pace;
  PaceMode paceMode = PaceMode.mpm;

  Distance();

  @override
  String getDisplayValue() {
    return '$distance ${units.name}';
  }

  String getDistanceDisplay() {
    return '${distance % 1 == 0 ? distance.toInt() : distance} ${units.name}';
  }

  String getPaceDisplay() {
    if (pace == null) {
      return 'open';
    } else if (paceMode == PaceMode.mpm) {
      return '${pace!.time.inMinutes}\' ${(pace!.time.inSeconds % 60).toString().padRight(2, '0')}" / ${units.name}';
    } else if (paceMode == PaceMode.meters) {
      return '${pace!.time.inMinutes}:${(pace!.time.inSeconds % 60).toString().padRight(2, '0')} / 25 m';
    } else {
      return '${pace!.distance} ${paceMode.name}';
    }
  }

  Distance addDistance(Distance distToAdd) {
    distance = distance + distToAdd.distance;
    return this;
  }

  @override
  // TODO: implement fromJsonFunction
  Function get fromJsonFunction => _$DistanceFromJson;

  factory Distance.fromJson(Map<String, dynamic> json) => FromJsonFactory().fromJson<Distance>(json);

  @override
  Map<String, dynamic> toJson() => _$DistanceToJson(this);

  // @override
  // Map<String, dynamic> toJson() {
  //   return {
  //     'type': 'distance',
  //     'distance': distance,
  //     'units': units.name,
  //     'pace': pace?.toJson(),
  //     'paceMode': paceMode.name,
  //   };
  // }
}