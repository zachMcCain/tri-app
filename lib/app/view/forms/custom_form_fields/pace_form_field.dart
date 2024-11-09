import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout/distance.dart';
import 'package:tri/app/models/workout/pace.dart';

class PaceFormField extends StatefulWidget {
  final ValueChanged<Pace> onChanged;
  final DistanceUnit unit;

  const PaceFormField({
    super.key,
    required this.onChanged,
    required this.unit,
  });

  @override
  State<PaceFormField> createState() => _PaceFormFieldState();
}

class _PaceFormFieldState extends State<PaceFormField> {

  void setTime(Duration dur) {
    Pace pace = Pace();
    pace.distance = 1;
    pace.time = dur;
    widget.onChanged(pace);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Expanded(
            // child: 
            CupertinoTimerPicker(
              onTimerDurationChanged: setTime, 
              mode: CupertinoTimerPickerMode.ms,
            ),
          // ),
          TextButton(onPressed: () => {Navigator.pop(context)}, child: const Text('Submit'))
        ]
      )
    );
  }
}