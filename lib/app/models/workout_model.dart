import 'package:flutter/material.dart';

class WorkoutModel extends ChangeNotifier {
  DateTime time = DateTime.now();
  double distance = 0.0;

  updateDistance(distance) {
    this.distance = distance;
    notifyListeners();
  }
}