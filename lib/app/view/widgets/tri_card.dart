import 'package:flutter/material.dart';

class TriCard extends StatelessWidget {
  final Widget child;

  const TriCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        height: 150,
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(3, 3))),
          elevation: .55,
          child: child,
        )
      )
    );
  }
}