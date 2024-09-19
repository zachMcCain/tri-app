import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselView(itemExtent: 300, children: [
        Card(child: Text("Log Workout")),
        Card(child: Text("Plan Workout")),
      ])
    ],);
    // TODO: implement build
    // throw UnimplementedError();
  }
}