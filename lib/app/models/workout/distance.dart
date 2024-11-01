import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/pace.dart';

class Distance extends AbstractSegment {
  double distance = 0.0;
  Pace? pace;

  @override
  String getDisplayValue() {
    String paceDisplay = pace != null ? 'at ${pace!.distance} miles per ${pace!.time.inHours} hour(s)' : '';
    return '$distance miles $paceDisplay';
  }
}