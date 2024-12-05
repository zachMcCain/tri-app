import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/data/docs_path.dart';
import 'package:http/http.dart' as http;

// part 'workouts_provider.g.dart';

class WorkoutsProvider extends ChangeNotifier {
  List<AbstractWorkout> workouts = [];

  WorkoutsProvider() {
    print('Setting up workoutsprovider with data');
    if (!kIsWeb) {
      DocsPath().getJsonData()
        .then((Map<String, String> idToJsonString) {
          // print("we have found something here" + idToJsonString.toString());
          // idToJsonString.values.forEach((val) => {
          //   print('We have a workout string here: $val')
          // });
          idToJsonString.forEach((id, jsonString) {
            final workoutJson = jsonDecode(jsonString) as Map<String, dynamic>;
            // take this and load it
            try {
              final workout = AbstractWorkout.fromJson(workoutJson);
              workouts.add(workout);
            } catch (e) {
              print("Exception creating the workout from $workoutJson, not adding to the list");
              print(e);
            }
          });
          notifyListeners();
        });
    }
  }

  void addWorkout(AbstractWorkout workout) {
    workouts.add(workout);
    print("Adding workout with id: ${workout.workoutId}");
    if (!kIsWeb) {
      DocsPath().writeJsonData(workout.toJson(), workout.workoutId);
    } else {
      print("Attempting to post it to /workout");
      http.post(Uri.parse("http://localhost:3000/workout"), 
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(workout.toJson())
      ).then((res) {
        print("Got a response: $res");
      });
      
      // .then((HttpClientRequest request) {
      //   request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
      //   request.write(workout.toJson());//.then((request) {request.close();});
      //   request.close().then((response) {
      //     print("Repsonse");
      //   });
      // });
      

    }
    notifyListeners();
  }

  Future<bool> removeWorkout(AbstractWorkout workout) async {
    print('Removing workout with id: ${workout.workoutId}');
    bool success = true;
    if (!kIsWeb) {
      success = await DocsPath().deleteJsonData('${workout.workoutId}.json');
    }
    workouts.remove(workout);
    print("Was workout removal successful? $success");
    notifyListeners();
    return success;
  }


}

final workoutsProvider = ChangeNotifierProvider<WorkoutsProvider>((ref) => WorkoutsProvider());

// final swimWorkoutsProvider = ChangeNotifierProvider<WorkoutsProvider>((ref) {

// })

// @riverpod
// List<AbstractWorkout> workouts(ref) {
//   return WorkoutsProvider().workouts;
// }