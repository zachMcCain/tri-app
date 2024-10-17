import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
import 'package:tri/app/view/forms/forms/run_form.dart';
import 'package:tri/app/view/forms/forms/swim_form.dart';
import 'package:tri/app/view/view_picker/abstract_result_widget.dart';

class WorkoutForm extends ResultWidget<double> {

  final WorkoutType workoutType;

  WorkoutForm({super.key, required this.workoutType});

  @override
  State<WorkoutForm> createState() => _WorkoutFormState();
  
  @override
  double? getResult() {
    return 33;
  }
}

class _WorkoutFormState extends State<WorkoutForm> {
  final _formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  final Widget workoutView = const SizedBox.shrink();

  Widget getWorkoutView() {
    if (widget.workoutType == WorkoutType.run) {
      return RunForm();
    } else if (widget.workoutType == WorkoutType.swim) {
      return SwimForm();
    }
    return RunForm();
  }

  final TimeOfDay time = TimeOfDay.now();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        title: const Text('TRI'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.9,
          child: Material(
            child: Form(
              key: _formKey, // used to save, reset, and validate every child FormField
              child: ListView(
                children: [
                  // Center(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //     Container(
                  //       padding: const EdgeInsets.all(7.0),
                  //       child: Text('${widget.workoutType.title} Workout', 
                  //         style: Theme.of(context).textTheme.headlineSmall,
                  //       )
                  //     ),
                  //     widget.workoutType.icon,
                  //   ]),
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(9)
                    ),
                    child: Column(
                      children: [
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
                      ],
                    ),
                  ),
                  // Placeholder(fallbackHeight: 100,),

                  // A general workout form should -
                    // Build duration from the added segments
                    // Build distance from the added segments
                      // So... like text title fields?
                    // Allow setting total duration (to be modified if segments overflow it?)
                    /**
                     * Hmmm... start with an "add +" button that opens up options of -
                     *  open segment, time, calories, distance, pace (distance over time)
                     *  Also maybe - warmup, cooldown?
                     *  Also maybe - other activity type?
                     * 
                     *  So maybe, top thing with goal thing, like
                     *  time with goal pace/heartrate
                     *  distance with goal pace/heartrate
                     *  
                     * 
                     * How to handle repeats? - give that as an "add" option when there is 
                     *  a repeatable segment available? - be able to select one or collection
                     *  of repeatable segments to repeat together
                     * 
                     * Maybe use a builder pattern? Workout builder?
                     * 
                     * Distance with goal pace
                     * Time with goal 
                     *
                     */

                  // TextFormField(
                  //   validator: Validators.notEmpty,
                  //   decoration: InputDecoration(hintText: "Placeholder for Workout Duration"),
                  //   controller: textController,
                    
                  // ),
                  // Give some buttons:
                    // Add target heartrate
                    // add segment
                    // add target cadence
                    // add target pace
                    // 
                  // TextFormField(
                  //   decoration: InputDecoration(hintText: "Placeholder for Workout Heartrate"),
                  //   keyboardType: TextInputType.number,
                  //   validator: Validators.isNumber,
                  // ),
                  getWorkoutView(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Notes',
                      ),
                      maxLines: 15,
                      // expands: true,
                      minLines: 5,
                    ),
                  ),
                  // StartTimeFormField<TimeOfDay>(
                  //   validator: Validators.notNull,
                  //   currentValue: time,
                  //   onChanged: (value) => {
                  //     print("Start time has changed to $value"),
                  //     if (value != null) {
                  //       setState(() {
                          
                  //         time = value;
                  //       })
                  //     }
                  //   },
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(textController.text)),
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

// class WorkoutFormState extends State<WorkoutForm> {

//   final _formKey = GlobalKey<FormState>();

//   final textController = TextEditingController();

//   Widget workoutView = const SizedBox.shrink();

//   Widget getWorkoutView() {
//     if (widget.workoutType == WorkoutType.run) {
//       return RunForm();
//     } else if (widget.workoutType == WorkoutType.swim) {
//       return SwimForm();
//     }
//     return RunForm();
//   }
  

//   onSubmit() {
//     if (_formKey.currentState!.validate()) {
//       // If the form is valid, display a snackbar. In the real world,
//       // you'd often call a server or save the information in a database.
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(textController.text)),
//       );
//     }
//   }

//   TimeOfDay time = TimeOfDay.now();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(        
  //       title: Text('TRI'),
  //       backgroundColor: Theme.of(context).colorScheme.primary,
  //     ),
  //     body: Center(
  //       child: FractionallySizedBox(
  //         widthFactor: 0.8,
  //         heightFactor: 0.9,
  //         child: Material(
  //           child: Form(
  //             key: _formKey, // used to save, reset, and validate every child FormField
  //             child: ListView(
  //               children: [
  //                 Center(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.end,
  //                     children: [
  //                     Container(
  //                       padding: const EdgeInsets.all(7.0),
  //                       child: Text('Build ${widget.workoutType.title} Workout', 
  //                         style: Theme.of(context).textTheme.headlineSmall,
  //                       )
  //                     ),
  //                     widget.workoutType.icon,
  //                   ]),
  //                 ),

  //                 // A general workout form should -
  //                   // Build duration from the added segments
  //                   // Build distance from the added segments
  //                     // So... like text title fields?
  //                   // Allow setting total duration (to be modified if segments overflow it?)
  //                   /**
  //                    * Hmmm... start with an "add +" button that opens up options of -
  //                    *  open segment, time, calories, distance, pace (distance over time)
  //                    *  Also maybe - warmup, cooldown?
  //                    *  Also maybe - other activity type?
  //                    * 
  //                    *  So maybe, top thing with goal thing, like
  //                    *  time with goal pace/heartrate
  //                    *  distance with goal pace/heartrate
  //                    *  
  //                    * 
  //                    * How to handle repeats? - give that as an "add" option when there is 
  //                    *  a repeatable segment available? - be able to select one or collection
  //                    *  of repeatable segments to repeat together
  //                    * 
  //                    * Maybe use a builder pattern? Workout builder?
  //                    * 
  //                    * Distance with goal pace
  //                    * Time with goal 
  //                    *
  //                    */

  //                 // TextFormField(
  //                 //   validator: Validators.notEmpty,
  //                 //   decoration: InputDecoration(hintText: "Placeholder for Workout Duration"),
  //                 //   controller: textController,
                    
  //                 // ),
  //                 // Give some buttons:
  //                   // Add target heartrate
  //                   // add segment
  //                   // add target cadence
  //                   // add target pace
  //                   // 
  //                 // TextFormField(
  //                 //   decoration: InputDecoration(hintText: "Placeholder for Workout Heartrate"),
  //                 //   keyboardType: TextInputType.number,
  //                 //   validator: Validators.isNumber,
  //                 // ),
  //                 getWorkoutView(),
  //                 const Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
  //                   child: TextField(
  //                     decoration: InputDecoration(
  //                       border: OutlineInputBorder(),
  //                       hintText: 'Notes',
  //                     ),
  //                     maxLines: 15,
  //                     // expands: true,
  //                     minLines: 5,
  //                   ),
  //                 ),
  //                 // StartTimeFormField<TimeOfDay>(
  //                 //   validator: Validators.notNull,
  //                 //   currentValue: time,
  //                 //   onChanged: (value) => {
  //                 //     print("Start time has changed to $value"),
  //                 //     if (value != null) {
  //                 //       setState(() {
                          
  //                 //         time = value;
  //                 //       })
  //                 //     }
  //                 //   },
  //                 // ),
  //                 ElevatedButton(
  //                   onPressed: onSubmit,
  //                   child: const Text('Submit')
  //                 )
  //               ],
  //             )
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
// }