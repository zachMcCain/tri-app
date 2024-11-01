import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/distance.dart';
import 'package:tri/app/models/workout/workout_duration.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';

class WorkoutSummaryVisitor implements Visitor<AbstractSegment> {
  WorkoutSummary summary = WorkoutSummary();

  @override
  visit(AbstractSegment segment) {
    print("Getting info in the visitor");
    if (segment is Distance) {
      summary.totalDistance ??= 0;
      summary.totalDistance = summary.totalDistance! + segment.distance;
    }
    if (segment is WorkoutDuration) {
      summary.totalTime ??= const Duration();
      summary.totalTime = summary.totalTime! + segment.duration;
    }
  }
}

class WorkoutSummary {
  double? totalDistance;
  Duration? totalTime;
  WorkoutType? type;
}