import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/pace.dart';

class WorkoutDuration extends AbstractSegment {
  Duration duration = const Duration();
  Pace? pace;

  @override
  String getDisplayValue() {
    return '${duration.inHours % 24} hours, ${duration.inMinutes % 60} minutes, ${duration.inSeconds % 60} seconds';
  }
}