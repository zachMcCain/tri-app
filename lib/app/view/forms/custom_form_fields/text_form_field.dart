import 'package:flutter/material.dart';
import 'package:tri/app/models/workout/text_segment.dart';
import 'package:tri/app/view/widgets/tri_text_input.dart';

class TextSegmentFormField extends StatefulWidget {
  final ValueChanged<TextSegment> onChanged;
  final FormFieldValidator<String>? validator;
  final String notes;

  const TextSegmentFormField({super.key, required this.onChanged, this.validator, this.notes = ''});

  @override
  State<TextSegmentFormField> createState() => _TextSegmentFormFieldState();
}

class _TextSegmentFormFieldState extends State<TextSegmentFormField> {
  TextSegment notes = TextSegment();
  @override
  void initState() {
    notes.description = widget.notes;
    super.initState();
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
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TriTextInput(onChanged: (data) {
                notes.description = data;
              }),
            ),
            IconButton(
              onPressed: () {
                widget.onChanged(notes);
                setState(() {
                  
                  notes = TextSegment();
                });
              }, 
              icon: const Icon(Icons.add)
            )
          ],
        ),
      )
    );
  }
}