import 'package:flutter/material.dart';

class TriHeader extends StatelessWidget {
  final String header;
  final TextStyle? style;

  const TriHeader({super.key, required this.header, this.style});

  @override
  Widget build(BuildContext context) {
    TextStyle? myStyle;
    if (style == null) {
      myStyle = Theme.of(context).textTheme.headlineSmall;
    } else {
      myStyle = style;
    }
    return Text(header, style: myStyle);// const TextStyle(fontSize: 20, color: Colors.black54,),);
  }
}