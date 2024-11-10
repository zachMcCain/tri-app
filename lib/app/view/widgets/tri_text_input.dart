import 'package:flutter/material.dart';

class TriTextInput extends StatelessWidget {
  final void Function(String) onChanged;
  final int? minLines;
  final int? maxLines;

  const TriTextInput({super.key, required this.onChanged, this.minLines, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Notes',
          fillColor: Colors.white70,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70)
          )
        ),
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
      ),
    );
  }
}