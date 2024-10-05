import 'package:tri/app/models/workout_models/workout_model.dart';
import 'package:uuid/uuid.dart';

class Workout implements WorkoutModel{
  @override
  Duration duration;

  @override
  int? heartRate;

  @override
  Uuid id = const Uuid();

  @override
  String label = '';

  @override
  String notes = '';

  @override
  DateTime startTime;

  Workout(this.duration, this.heartRate, this.startTime);

  @override
  Duration getDuration() {
    return duration;
  }

  @override
  Uuid getId() {
    return id;
  }

  @override
  String getLabel() {
    return label;
  }

  @override
  String getNotes() {
    return notes;
  }

  @override
  DateTime getStartTime() {
    return startTime;
  }

  @override
  void setDuration(Duration duration) {
    this.duration = duration;
  }

  @override
  void setLabel(String label) {
    this.label = label;
  }

  @override
  void setNotes(String notes) {
    this.notes = notes;
  }

  @override
  void setStartTime(DateTime startTime) {
    this.startTime = startTime;
  }
  
}