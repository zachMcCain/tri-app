import 'package:flutter/material.dart';

class FakeWorkoutModel extends ChangeNotifier {
  int counter = 0;

  addCounter() {
    counter++;
    notifyListeners();
  }

  subtractCounter() {
    counter--;
    notifyListeners();
  }
}