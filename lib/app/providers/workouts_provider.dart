import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/data/docs_path.dart';

// part 'workouts_provider.g.dart';

class WorkoutsProvider extends ChangeNotifier {
  List<AbstractWorkout> workouts = [];

  WorkoutsProvider() {
    print('Setting up workoutsprovider with data');
    DocsPath().getJsonData()
      .then((Map<String, String> idToJsonString) {
        // print("we have found something here" + idToJsonString.toString());
        // idToJsonString.values.forEach((val) => {
        //   print('We have a workout string here: $val')
        // });
        idToJsonString.forEach((id, jsonString) {
          final workoutJson = jsonDecode(jsonString) as Map<String, dynamic>; // format error at character 2 in {__type: Run, }
          // take this and load it
          final workout = AbstractWorkout.fromJson(workoutJson);
          workouts.add(workout);
        });
      });
    notifyListeners();
  }

  void addWorkout(AbstractWorkout workout) {
    workouts.add(workout);
    DocsPath().writeJsonData(workout.toJson(), workout.id);
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