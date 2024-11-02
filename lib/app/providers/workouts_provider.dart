

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';

class WorkoutsProvider extends ChangeNotifier {
  List<AbstractWorkout> workouts = [];

  addWorkout(AbstractWorkout workout) {
    workouts.add(workout);
    notifyListeners();
  }
}

final workoutsProvider = ChangeNotifierProvider<WorkoutsProvider>((ref) => WorkoutsProvider());