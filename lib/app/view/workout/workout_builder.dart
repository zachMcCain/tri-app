import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
import 'package:tri/app/view/view_picker/view_picker.dart';
import 'package:tri/app/view/workout/workout_list.dart';

class WorkoutBuilder extends StatelessWidget {
  const WorkoutBuilder({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: const [
          // Have 
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text('Build Workout from Type', style: TextStyle(fontSize: 20),),
          ),
          // SizedBox(height: 20,),
          Material(child: ViewPicker(tiles: WorkoutType.values),),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text('Start with Your Workout', style: TextStyle(fontSize: 20),),
          ),
          SizedBox(
            height: 300, 
            child: WorkoutList(
              removable: true,
              placeholder: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('No workouts have been built yet.'),
                      SizedBox(height: 10,),
                      Text('As you build workouts, you will be able to select them here for editing.'),
                    ],
                  ),
                )
              ),
            )
          ),
        ],
      ),
    );
  }
}