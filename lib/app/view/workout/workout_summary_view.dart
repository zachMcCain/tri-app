import 'package:flutter/material.dart';
import 'package:tri/app/models/workout/workout_summary_visitor.dart';

class WorkoutSummaryView extends StatelessWidget {
  WorkoutSummary summary;

  WorkoutSummaryView({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(summary.type?.name.toString().toUpperCase() ?? 'Open'),
          const Spacer(),
          Text('Time: ${summary.totalTime?.toString() ?? 'Open'}'),
          const Spacer(),
          Text('Distance: ${summary.totalDistance?.toString() ?? 'Open'}'),
        ],
      ),
    );
  }
  
}