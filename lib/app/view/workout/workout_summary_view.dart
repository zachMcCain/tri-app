import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/models/workout/workout_summary_visitor.dart';
import 'package:tri/app/providers/workouts_provider.dart';

class WorkoutSummaryView extends ConsumerStatefulWidget {
  final AbstractWorkout workout;
  final bool removable;

  const WorkoutSummaryView({super.key, required this.workout, this.removable = false});

  @override
  ConsumerState<WorkoutSummaryView> createState() => _WorkoutSummaryViewState();
}

class _WorkoutSummaryViewState extends ConsumerState<WorkoutSummaryView> {
  @override
  Widget build(BuildContext context) {

    // Provider tracking user's list of workouts
    final workoutList = ref.watch(workoutsProvider);
    WorkoutSummaryVisitor summaryVisitor = WorkoutSummaryVisitor(type: widget.workout.type);
    widget.workout.accept(summaryVisitor);

    String summaryTitle = widget.workout.name != null && widget.workout.name!.isNotEmpty ? widget.workout.name! : summaryVisitor.summary.type.name.toString().toUpperCase();
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                // summaryVisitor.summary.type.icon,
                // const SizedBox(width: 9,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Icon(size: 17, summaryVisitor.summary.type.icon),
                ),
                Text(summaryTitle),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Planned Distance:'),
                    Text(summaryVisitor.getDistanceDisplay())
                  ],
                ),
                const SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Planned Time:'),
                    Text(summaryVisitor.getTimeDisplay())
                  ],
                ),
                const Spacer(),
                widget.removable ? IconButton(
                  alignment: Alignment.centerRight, 
                  onPressed: () => workoutList.removeWorkout(widget.workout), 
                  icon: Icon(Icons.delete)
                ) : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}