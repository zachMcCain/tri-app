// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbstractWorkout _$AbstractWorkoutFromJson(Map<String, dynamic> json) =>
    AbstractWorkout()
      ..$type = json['__type'] as String?
      ..workoutNotes = json['workoutNotes'] as String?;

Map<String, dynamic> _$AbstractWorkoutToJson(AbstractWorkout instance) =>
    <String, dynamic>{
      '__type': instance.$type,
      'workoutNotes': instance.workoutNotes,
    };
