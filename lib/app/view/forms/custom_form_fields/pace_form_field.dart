import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tri/app/models/units/distance_unit.dart';
import 'package:tri/app/models/workout/pace.dart';

class PaceFormField extends StatefulWidget {
  final ValueChanged<Pace> onChanged;
  final DistanceUnit unit;
  final PaceMode paceMode;

  const PaceFormField({
    super.key,
    required this.onChanged,
    required this.unit,
    this.paceMode = PaceMode.mpm,
  });

  @override
  State<PaceFormField> createState() => _PaceFormFieldState();
}

class _PaceFormFieldState extends State<PaceFormField> {
  double _currentMiles = 0;

  void setTime(Duration dur) {
    Pace pace = Pace();
    pace.distance = 1;
    pace.time = dur;
    widget.onChanged(pace);
  }

  void setMiles(double mi) {
    setState(() {
      _currentMiles = mi;
      Pace pace = Pace();
      pace.distance = mi;
      pace.time = const Duration(hours: 1);
      widget.onChanged(pace);
    });
  }

  Widget getPicker() {
    if (widget.paceMode == PaceMode.mph) {
      return DecimalNumberPicker(
        minValue: 0, 
        maxValue: 100, 
        value: _currentMiles, 
        decimalPlaces: 2,
        decimalTextMapper: (numberText) => '.$numberText ${widget.paceMode.name}',
        onChanged: setMiles
      );
    } else {
      return CupertinoTimerPicker(
        onTimerDurationChanged: setTime, 
        mode: CupertinoTimerPickerMode.ms,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          getPicker(),
          TextButton(onPressed: () => {Navigator.pop(context)}, child: const Text('Submit'))
        ]
      )
    );
  }
}

enum PaceMode {
  mph, // miles per hour
  mpm, // minutes per mile
  meters,
}