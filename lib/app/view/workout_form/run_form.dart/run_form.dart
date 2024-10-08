import 'package:flutter/material.dart';

class RunForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "Placeholder for Cadence"),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Placeholder for Distance"),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Placeholder for Elevation"),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Placeholder for Pace"),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Placeholder for Power"),
          ),
        ]
      ),
    );
  }
}