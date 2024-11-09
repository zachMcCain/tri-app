import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/app/models/workout/workout_factory.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
import 'package:tri/app/providers/workouts_provider.dart';
import 'package:tri/app/view/forms/workout_form_factory.dart';
import 'package:tri/app/view/workout/full_workout_view.dart';

class WorkoutForm extends ConsumerStatefulWidget {

  final WorkoutType workoutType;

  const WorkoutForm({super.key, required this.workoutType});

  @override
  ConsumerState<WorkoutForm> createState() => _WorkoutFormState();
}

class _WorkoutFormState extends ConsumerState<WorkoutForm> {
  final _formKey = GlobalKey<FormState>();

  final textController = TextEditingController();
  FullWorkoutView? builtWorkout; // This is where the workout view goes
  late AbstractWorkout workout;

  @override
  void initState() {
    super.initState();
    workout = WorkoutFactory().create(widget.workoutType);
  }

  void onWorkoutChanged(value) {
    if (value is Widget) {
        setState(() {
          
          builtWorkout = FullWorkoutView(workout: workout);
        });

      } else if (value is AbstractSegment) {
        print("We got a SEGMENT!");
        setState(() {
          workout.segments.add(value);
          builtWorkout = FullWorkoutView(workout: workout,);
          print('The new builtWorkout is: $builtWorkout from $workout');
        });
      }
  }

  List<Widget> getWorkoutView() {
    // TODO: Make this a particular widget based on the workout type
    // with something like the strava view at the top of a workout
    return [
      // Title of the Workout Form
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            padding: const EdgeInsets.all(7.0),
            child: Text('${widget.workoutType.title} Workout', 
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ),
          widget.workoutType.icon,
        ]),
      ),
      builtWorkout ?? const Text('No Workout Info Yet')
    ];
  }

  void onNotesChanged(String val) {
    setState(() {
      workout.workoutNotes = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Provider tracking user's list of workouts
    final workoutList = ref.watch(workoutsProvider);

    // The full layout
    return Scaffold(
      // AppBar with title and navigation
      appBar: AppBar(        
        title: const Text('TRI'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // Workout form holder
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.9,
          child: Material(
            // The Actual Form
            child: Form(
              key: _formKey, // used to save, reset, and validate every child FormField
              child: ListView(
                children: [
                  // Places the Metadata from the Workout
                  ...getWorkoutView(),
                  // Gets the Actual Form Based on Type
                  WorkoutFormFactory().getWorkoutForm(widget.workoutType, onWorkoutChanged),
                  // The Notes Section of All Workout Forms
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Notes',
                      ),
                      onChanged: onNotesChanged,
                      maxLines: 15,
                      minLines: 5,
                    ),
                  ),
                  // The Submit Button
                  TextButton(
                    onPressed: () {
                      // ref.
                      if (workout.valid()) {
                        workoutList.addWorkout(workout);
                        // This needs to add the built workout to the overall app state

                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: 
                            Column(children: [...getWorkoutView()],)
                          )
                        );
                        Navigator.pop(context);
                      

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: 
                            Text('Nothing to Submit')
                          )
                        );
                      }

                    },
                    child: const Text('Submit')
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
