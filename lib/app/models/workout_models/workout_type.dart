
import 'package:flutter/material.dart';
import 'package:tri/app/view/forms/workout_form.dart';
import 'package:tri/app/view/view_picker/abstract_view_tile.dart';

enum WorkoutType implements AbstractViewTile {
  swim,
  bike,
  run,
  brick,
  strength,
  custom;

  @override
  String get title => this == WorkoutType.swim ? 'Swim' : 
    this == WorkoutType.bike ? 'Bike' :
    this == WorkoutType.run ? 'Run' :
    this == WorkoutType.brick ? 'Brick' :
    this == WorkoutType.strength ? 'Strength' :
    'Custom';

  @override
  Icon get icon =>  this == WorkoutType.swim ? const Icon(Icons.water) : 
    this == WorkoutType.bike ? const Icon(Icons.directions_bike):
    this == WorkoutType.run ? const Icon(Icons.run_circle_outlined):
    this == WorkoutType.brick ? const Icon(Icons.speed):
    this == WorkoutType.strength ? const Icon(Icons.cabin):
    const Icon(Icons.dashboard_customize);
  
  @override
  Icon? get trailing => const Icon(Icons.list);

  @override
  Widget onTap(Function(Object val) callback) {
    return WorkoutForm(workoutType: this);
  }
  
}
