import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:tri/app/view/widgets/tri_header.dart';
import 'package:tri/app/view/widgets/tri_summary.dart';
import 'package:tri/app/view/workout/workout_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  

  @override
  Widget build(BuildContext context) {


    // Summary of what is coming up and what has happend a week out
    // The next workout with the ability to "log as completed"
    // Some form of stats over the course of the last n months where n is dynamic based on first workout in the log to a max of 1 year



    CalendarControllerProvider.of(context).controller.getEventsOnDay(DateTime.now());

    return const Column(
      children: [
        TriHeader(header: "Welcome"),
        TriSummary(),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: WeekView(
              heightPerMinute: .5,
              startHour: 5,
              endHour: 24,
              // hourIndicatorSettings: HourIndicatorSettings(startHour: 7),
            
            ),
          )
        ),
        // WorkoutList(placeholder: Text("Wilkommen alles")),
      ],
    );
  }
  
}