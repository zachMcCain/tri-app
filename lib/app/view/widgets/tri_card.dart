import 'package:flutter/material.dart';

class TriCard extends StatelessWidget {
  final Widget child;
  final double padding;

  const TriCard({super.key, required this.child, this.padding = 3});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(3, 3))),
        elevation: .55,
        color: Theme.of(context).cardColor,
        child: child,
      )
    );
  }
}