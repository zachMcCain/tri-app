import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';

// part 'workouts_provider.g.dart';

class WorkoutsProvider extends ChangeNotifier {
  List<AbstractWorkout> workouts = [];

  void addWorkout(AbstractWorkout workout) {
    workouts.add(workout);
    notifyListeners();
  }
}

final workoutsProvider = ChangeNotifierProvider<WorkoutsProvider>((ref) => WorkoutsProvider());

// final swimWorkoutsProvider = ChangeNotifierProvider<WorkoutsProvider>((ref) {

// })

// @riverpod
// List<AbstractWorkout> workouts(ref) {
//   return WorkoutsProvider().workouts;
// }