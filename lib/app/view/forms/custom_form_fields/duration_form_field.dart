import 'package:flutter/cupertino.dart';
import 'package:tri/app/models/workout/pace.dart';
import 'package:tri/app/models/workout/workout_duration.dart';

class DurationFormField extends StatefulWidget {
  final ValueChanged<WorkoutDuration> onChanged;
  final FormFieldValidator<String>? validator;
  final double? currentValue;

  const DurationFormField({
    super.key,
    required this.onChanged,
    required this.currentValue,
    required this.validator,
  });

  @override
  State<DurationFormField> createState() => _DurationFormFieldState();
}

class _DurationFormFieldState extends State<DurationFormField> {
  WorkoutDuration duration = WorkoutDuration();

  void setDuration(Duration dur) {
    duration.duration = dur;
    widget.onChanged(duration);
  }

  void setPace(Pace pace) {
    duration.pace = pace;
    widget.onChanged(duration);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: CupertinoTimerPicker(
        onTimerDurationChanged: setDuration, 
        mode: CupertinoTimerPickerMode.hms,
      )
    );
  }
}