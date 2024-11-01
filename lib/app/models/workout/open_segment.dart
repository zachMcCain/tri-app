import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/pace.dart';

class OpenSegment extends AbstractSegment {
  Pace? pace;
  @override
  String getDisplayValue() {
    return 'Open';
  }
}