import 'package:flutter/material.dart';

class TriTextInput extends StatelessWidget {
  final void Function(String) onChanged;
  final int? minLines;
  final int? maxLines;
  final String hintText;
  final Color? fillColor;

  const TriTextInput({super.key, required this.onChanged, this.minLines, this.maxLines, this.hintText = 'notes', this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        decoration: 
        InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          fillColor: fillColor,
          filled: fillColor != null ? true : false,
        ),
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
      ),
    );
  }
}