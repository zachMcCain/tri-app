import 'package:flutter/material.dart';

class StartTimeFormField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final TimeOfDay? currentValue;

  const StartTimeFormField({
    super.key,
    required this.onChanged,
    required this.currentValue,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {

    // dialogue() {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return TimePickerDialog(initialTime: TimeOfDay.now(), initialEntryMode: TimePickerEntryMode.input,
    //       confirmText: "Confirm?", );
    //     },
    //   );

    // }
    // showTimePicker(context: context, initialTime: initialTime)


    return Column(
      children: [
        TextFormField(
          initialValue: currentValue.toString(),
          onChanged: onChanged,
          decoration: const InputDecoration(
            hintText: '6:33 pm',
            labelText: 'Start Time',
            helperText: "",
            icon: Icon(Icons.timer)
          ),
          validator: validator,
          onTap: () {
            showTimePicker(context: context, initialTime: TimeOfDay.now(), onEntryModeChanged: (mode) => {print("Mode changed to $mode")},);
          },
        ),
        // TimePickerDialog(initialTime: TimeOfDay.now(), initialEntryMode: TimePickerEntryMode.input,),
      ],
    );
  }

}