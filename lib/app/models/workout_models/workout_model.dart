
// Abstract class to hold the data that all workouts need
abstract class WorkoutModel {
  abstract Duration duration;
  abstract String notes;
  abstract String label;
  abstract DateTime startTime;
  abstract int? heartRate;
  abstract String id;


  String getLabel() {
    return label;
  }

  void setLabel(String label) {
    this.label = label;
  }

  String getNotes() {
    return notes;
  }

  void setNotes(String notes);

  Duration getDuration() {
    return duration;
  }

  void setDuration(Duration duration) {
    this.duration = duration;
  }

  DateTime getStartTime() {
    return startTime;
  }

  void setStartTime(DateTime startTime) {
    this.startTime = startTime;
  }

  String getId() {
    return id;
  }
}
