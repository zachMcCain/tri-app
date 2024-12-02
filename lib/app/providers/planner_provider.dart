import 'package:calendar_view/calendar_view.dart';

class PlannerProvider extends CalendarControllerProvider {
  const PlannerProvider({super.key, required super.controller, required super.child});
  // We could have this as a map between date and list of workouts...
  // We could wrap a workout in a "ScheduledWorkout"
  // We could wrap a workout in a "CompletedWorkout"
  // We could wrap a list of workouts in a "Day"
  @override
  // TODO: implement controller
  EventController<Object?> get controller => super.controller;

  
}