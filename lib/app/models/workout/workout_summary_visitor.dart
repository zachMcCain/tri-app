import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:tri/app/models/workout_models/segments/abstract_segment.dart';
import 'package:tri/app/models/workout_models/segments/distance.dart';
import 'package:tri/app/models/workout_models/segments/workout_duration.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';

class WorkoutSummaryVisitor implements Visitor<AbstractSegment> {
  final WorkoutSummary summary;

  WorkoutSummaryVisitor({required WorkoutType type})
    : summary = WorkoutSummary(type: type);

  @override
  visit(AbstractSegment segment) {
    if (segment is Distance) {
      summary.totalDistance ??= Distance();
      summary.totalDistance = summary.totalDistance!.addDistance(segment);
    }
    if (segment is WorkoutDuration) {
      summary.totalTime ??= const Duration();
      summary.totalTime = summary.totalTime! + segment.duration;
    }
  }

  String getDistanceDisplay() {
    if (summary.totalDistance?.distance != null) {
      return '${summary.totalDistance!.distance.toString()} ${'${summary.totalDistance!.units.name}'}';
    } else {
      return 'Open';
    }
  }

  String getTimeDisplay() {
    if (summary.totalTime?.inSeconds != null) {
      int minutes = summary.totalTime!.inMinutes % 60;
      int hours = summary.totalTime!.inHours % 24;
      int seconds = summary.totalTime!.inSeconds % 60;
      return '${hours > 0 ? '${hours.toString()} hours' : ''} ${minutes > 0 ? '${minutes.toString()} minutes' : ''} ${seconds > 0 ? '${seconds.toString()} seconds' : ''}';
    } else {
      return 'Open';
    }
  }

  Distance? get totalDistance => summary.totalDistance;
  Duration? get totalDuration => summary.totalTime;
}

class WorkoutSummary {
  Distance? totalDistance;
  Duration? totalTime;
  WorkoutType type;

  WorkoutSummary({required this.type});

  addSummary(WorkoutSummary summary) {
    if (summary.type != type) {
      return;
    } else {
      totalDistance = totalDistance?.addDistance(summary.totalDistance) ?? summary.totalDistance;
      if (totalTime != null) {
        if (summary.totalTime != null) {
          totalTime = totalTime! + summary.totalTime!;
        }
      } else {
        totalTime = summary.totalTime;
      }
    }
  }
}