import 'package:flutter/material.dart';

class StartTimeFormField<T> extends FormField<TimeOfDay> {
  final ValueChanged<TimeOfDay?> onChanged;
  @override
  final FormFieldValidator<TimeOfDay>? validator;
  final TimeOfDay currentValue;

  StartTimeFormField({
    super.key,
    required this.onChanged,
    required this.currentValue,
    required this.validator, 
    // required super.builder,
  }) : super(
    initialValue: currentValue,
    autovalidateMode: AutovalidateMode.disabled,
    builder: (FormFieldState<TimeOfDay> field) {

        // dialogue() {
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return TimePickerDialog(initialTime: TimeOfDay.now(), initialEntryMode: TimePickerEntryMode.input,
        //       confirmText: "Confirm?", );
        //     },
        //   );

        // }
        // showTimePicker(context: context, initialTime: TimeOfDay.now());


        return Row(
          children: [

            IconButton(
              icon: const Icon(
                Icons.access_time_outlined,
              ),
              onPressed: () => showTimePicker(
                context: field.context, 
                initialTime: currentValue,
              ).then((value) => {
                onChanged(value)},),
            ),
            Text(currentValue.format(field.context))
          ]
        );

        // return Column(
        //   children: [
        //     TextFormField(
        //       initialValue: currentValue.toString(),
        //       onChanged: onChanged,
        //       decoration: const InputDecoration(
        //         hintText: '6:33 pm',
        //         labelText: 'Start Time',
        //         helperText: "",
        //         icon: Icon(Icons.timer)
        //       ),
        //       validator: validator,
        //       onTap: () {
        //         Future<TimeOfDay?> time = showTimePicker(context: context, initialTime: TimeOfDay.now(), onEntryModeChanged: (mode) => {print("Mode changed to $mode")},);
        //         time.then((value) => onChanged(value.toString()),);
        //       },
        //     ),
        //     // TimePickerDialog(initialTime: TimeOfDay.now(), initialEntryMode: TimePickerEntryMode.input,),
        //   ],
        // );
      
    },
  );

}