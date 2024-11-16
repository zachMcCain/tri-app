import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/pace.dart';
import 'package:tri/app/view/forms/custom_form_fields/pace_form_field.dart';

class Distance extends AbstractSegment {
  DistanceUnit units = DistanceUnit.mi;
  double distance = 0.0;
  Pace? pace;
  PaceMode paceMode = PaceMode.mpm;

  @override
  String getDisplayValue() {
    String paceDisplay = pace != null ? 'Pace: $getPaceDisplay()' : '';
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
}