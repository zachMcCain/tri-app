import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/pace.dart';

class Distance extends AbstractSegment {
  DistanceUnit units = DistanceUnit.mi;
  double distance = 0.0;
  Pace? pace;

  @override
  String getDisplayValue() {
    String paceDisplay = pace != null ? 'Pace: $getPaceDisplay()' : '';
    return '$distance ${units.name} \n $paceDisplay';
  }

  String getDistanceDisplay() {
    return '$distance ${units.name}';
  }

  String getPaceDisplay() {
    return pace != null ? '${pace!.time.inMinutes}\' ${pace!.time.inSeconds % 60}" / ${units.name}' : '';
  }

  Distance addDistance(Distance distToAdd) {
    distance = distance + distToAdd.distance;
    return this;
  }
}