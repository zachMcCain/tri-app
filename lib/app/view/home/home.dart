import 'dart:math';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/view/widgets/tri_card.dart';
import 'package:tri/app/view/widgets/tri_header.dart';
import 'package:tri/app/view/widgets/tri_summary.dart';
import 'package:tri/app/view/workout/full_workout_view.dart';
import 'package:collection/collection.dart';

class Home extends StatelessWidget {
  const Home({super.key});



  AbstractWorkout? getNextWorkout(BuildContext context) {
    CalendarEventData<Object?>? data = CalendarControllerProvider.of(context).controller.allEvents.firstWhereOrNull((event) {
      return (event.event is AbstractWorkout) && event.date.isAfter(DateTime.now());
    });
    if (data != null) {
      return (data.event as AbstractWorkout);
    } else {
      return null;
    }
  }
  
  Widget nextUp(BuildContext context) {
    AbstractWorkout? nextWorkout = getNextWorkout(context);
    return nextWorkout != null ? FullWorkoutView(workout: nextWorkout) : const Text("Plan Your Next Workout!");
  }

  @override
  Widget build(BuildContext context) {
    List<String> welcomePhrases = [
      "Time to Crush It!",
      "Welcome, Let's Get to Work",
      "Looking Good!",
      "Show 'em How it's Done!"
    ];

    // Summary of what is coming up and what has happend a week out
    // The next workout with the ability to "log as completed"
    // Some form of stats over the course of the last n months where n is dynamic based on first workout in the log to a max of 1 year
    AbstractWorkout? nextWorkout = getNextWorkout(context);

    return ListView(
      children: [
        const SizedBox(height: 20,),
        Center(child: TriHeader(header: welcomePhrases[Random().nextInt(welcomePhrases.length)])),
        const SizedBox(height: 20,),
        const TriSummary(),
        TriCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const TriHeader(header: "Next Up"),
              ),
              nextUp(context)
            ],
          )
        )
        

        // Expanded(
        //   child: Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: WeekView(
        //       heightPerMinute: .5,
        //       startHour: 5,
        //       endHour: 24,
        //       // hourIndicatorSettings: HourIndicatorSettings(startHour: 7),
            
        //     ),
        //   )
        // ),
        // WorkoutList(placeholder: Text("Wilkommen alles")),
      ],
    );
  }
  
}