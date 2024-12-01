import 'package:flutter/material.dart';

class TriCard extends StatelessWidget {
  final Widget child;
  final double height;

  const TriCard({super.key, required this.child, this.height = 150});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      // child: SizedBox(
      //   height: height,
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(3, 3))),
          elevation: .55,
          child: child,
        )
      // )
    );
  }
}