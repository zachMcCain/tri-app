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



  CalendarEventData<Object?>? getNextWorkout(BuildContext context) {
    CalendarEventData<Object?>? data = CalendarControllerProvider.of(context).controller.allEvents.firstWhereOrNull((event) {
      return (event.event is AbstractWorkout) && event.date.isAfter(DateTime.now());
    });
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  String formatDate(DateTime date) {
    String dateSlug ="${date.year.toString()}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')}";
    return dateSlug;
  }
  
  Widget nextUp(BuildContext context) {
    CalendarEventData<Object?>? nextWorkout = getNextWorkout(context);
    return TriCard(
      padding: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const TriHeader(header: "Next Up"),
                const Spacer(),
                nextWorkout != null? Text(formatDate(nextWorkout.date), textScaler: const TextScaler.linear(1.2), style: Theme.of(context).textTheme.bodySmall) : Container()
              ],
            ),
          ),
          (nextWorkout?.event != null) ? 
            FullWorkoutView(workout: (nextWorkout!.event as AbstractWorkout)) : 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Nothing Upcoming, Time to Plan Your Next Workout!", style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 20,)
                ],
              ),
            )
          ]
        )
      );
    
  }

  @override
  Widget build(BuildContext context) {
    List<String> welcomePhrases = [
      // "Time to Crush It!",
      "Welcome! Let's Get to Work",
      // "Looking Good!",
      // "Show 'em How it's Done!"
    ];

    // Summary of what is coming up and what has happend a week out
    // The next workout with the ability to "log as completed"
    // Some form of stats over the course of the last n months where n is dynamic based on first workout in the log to a max of 1 year

    return ListView(
      children: [
        // const SizedBox(height: 20,),
        TriCard(
          padding: 0,
          child: Center(
            heightFactor: 2,
            child: TriHeader(header: welcomePhrases[Random().nextInt(welcomePhrases.length)], style: Theme.of(context).textTheme.headlineMedium,)
          )
        ),
        // const SizedBox(height: 20,),
        const TriSummary(),
        nextUp(context)
      ],
    );
  }
  
}