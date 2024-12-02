import 'package:flutter/material.dart';

class TriHeader extends StatelessWidget {
  final String header;

  const TriHeader({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Text(header, style: const TextStyle(fontSize: 20, color: Colors.black54,),);
  }
}