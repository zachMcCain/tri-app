import 'package:carp_serializable/carp_serializable.dart';
import 'package:flutter/material.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/abstract_workout.dart';
import 'package:tri/app/models/workout/bike.dart';
import 'package:tri/app/models/workout/brick.dart';
import 'package:tri/app/models/workout/custom.dart';
import 'package:tri/app/models/workout/distance.dart';
import 'package:tri/app/models/workout/open_segment.dart';
import 'package:tri/app/models/workout/pace.dart';
import 'package:tri/app/models/workout/run.dart';
import 'package:tri/app/models/workout/strength.dart';
import 'package:tri/app/models/workout/swim.dart';
import 'package:tri/app/models/workout/text_segment.dart';
import 'package:tri/app/models/workout/workout_duration.dart';
import 'package:tri/app/view/home/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope( 
    child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FromJsonFactory().register(AbstractWorkout());
    FromJsonFactory().register(AbstractSegment());
    FromJsonFactory().register(Run());
    FromJsonFactory().register(Pace());
    FromJsonFactory().register(Distance());
    FromJsonFactory().register(OpenSegment());
    FromJsonFactory().register(WorkoutDuration());
    FromJsonFactory().register(Strength());
    FromJsonFactory().register(Swim());
    FromJsonFactory().register(Bike());
    FromJsonFactory().register(Brick());
    FromJsonFactory().register(Custom());
    FromJsonFactory().register(TextSegment());


    return MaterialApp(
      title: 'TRI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[300]
      ),
      home: const MyHomePage(title: 'TRI',),
    );
  }
}
