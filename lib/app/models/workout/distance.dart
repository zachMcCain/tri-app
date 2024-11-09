import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/pace.dart';

class Distance extends AbstractSegment {
  DistanceUnit units = DistanceUnit.mile;
  double distance = 0.0;
  Pace? pace;

  @override
  String getDisplayValue() {
    String paceDisplay = pace != null ? 'Pace: ${pace!.time.inMinutes}\' ${pace!.time.inSeconds % 60}" / ${units.name}' : '';
    return '$distance ${units.name} \n $paceDisplay';
  }
}