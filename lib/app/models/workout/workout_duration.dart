import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/pace.dart';
import 'package:tri/app/view/forms/custom_form_fields/pace_form_field.dart';

class WorkoutDuration extends AbstractSegment {
  Duration duration = const Duration();
  DistanceUnit? units = DistanceUnit.mi;
  Pace? pace;
  PaceMode paceMode = PaceMode.mpm;

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
    if (paceMode == PaceMode.mpm) {
      return pace != null ? '${pace!.time.inMinutes}\' ${pace!.time.inSeconds % 60}" / ${units!.name}' : '';
    } else {
      return pace != null ? '${pace!.distance} ${paceMode.name}' : '';
    }
  }
}