import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout/pace.dart';
import 'package:tri/app/models/workout/workout_duration.dart';
import 'package:tri/app/view/forms/custom_form_fields/pace_form_field.dart';

class DurationFormField extends StatefulWidget {
  final ValueChanged<WorkoutDuration> onChanged;
  final FormFieldValidator<String>? validator;
  final WorkoutDuration? currentValue;
  final PaceMode paceMode;

  const DurationFormField({
    super.key,
    required this.onChanged,
    this.currentValue,
    this.validator,
    this.paceMode = PaceMode.mpm
  });

  @override
  State<DurationFormField> createState() => _DurationFormFieldState();
}

class _DurationFormFieldState extends State<DurationFormField> {
  WorkoutDuration duration = WorkoutDuration();

  void setDuration(Duration dur) {
    setState(() {
      duration.duration = dur;
    });
  }

  void setPace(Pace pace) {
    setState(() {
      duration.paceMode = widget.paceMode;
      duration.pace = pace;
    });
  }

  Widget getDurationOrEditor() {
    if (duration.duration.inMilliseconds > 0) {
      return TextButton(
        onPressed: onDurationEdit,
        child: Text(duration.getDisplayValue())
      );
    } else {
      return TextButton(
        onPressed: onDurationEdit, 
        child: const Text('Add Target Time')
      );
    }
  }

  void onDurationEdit() {
    showDialog(context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoTimerPicker(
              onTimerDurationChanged: setDuration,
              mode: CupertinoTimerPickerMode.hms,
              initialTimerDuration: duration.duration,
            ),
            TextButton(onPressed: () => {Navigator.pop(context)}, child: const Text('Submit'))
          ],
        )
      ),
    );
  }

  Widget getPaceOrButton() {
    if (duration.pace != null) {
      return TextButton(
        onPressed: paceDialog,
        child: Column(
          children: [
            const Text('Target Pace:'),
            Text(duration.getPaceDisplay())
          ],
        ),
      );
    } else {
      return TextButton(
        onPressed: () {
          paceDialog();
        }, 
        child: const Text('Set Pace Target')
      );
    }
  }

  Future<dynamic> paceDialog() {
    return showDialog(context: context, 
          builder: (context) => Dialog(
            child: PaceFormField(
              onChanged: setPace, 
              unit: DistanceUnit.mi,
              paceMode: widget.paceMode,
            ),
          )
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white70,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getDurationOrEditor(),
            getPaceOrButton(),
            IconButton(
              onPressed: () {
                widget.onChanged(duration);
                setState(() {
                  
                  duration = WorkoutDuration();
                });
              }, 
              icon: const Icon(Icons.add)
            )
          ],
        ),
      ),
    );
  }
}