import 'package:flutter/cupertino.dart';

class DurationFormField extends StatefulWidget {
  final ValueChanged<Duration> onChanged;
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: CupertinoTimerPicker(onTimerDurationChanged: widget.onChanged, mode: CupertinoTimerPickerMode.hms,)
    );
  }
}