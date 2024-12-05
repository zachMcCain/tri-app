import 'package:calendar_view/calendar_view.dart';
import 'package:carp_serializable/carp_serializable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/segments/abstract_segment.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/models/workout_models/bike.dart';
import 'package:tri/app/models/workout_models/brick.dart';
import 'package:tri/app/models/workout_models/custom.dart';
import 'package:tri/app/models/workout_models/segments/distance.dart';
import 'package:tri/app/models/workout_models/segments/open_segment.dart';
import 'package:tri/app/models/workout_models/targets/pace.dart';
import 'package:tri/app/models/workout_models/run.dart';
import 'package:tri/app/models/workout_models/strength.dart';
import 'package:tri/app/models/workout_models/swim.dart';
import 'package:tri/app/models/workout_models/segments/text_segment.dart';
import 'package:tri/app/models/workout_models/segments/workout_duration.dart';
import 'package:tri/app/view/scaffold/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flex_color_scheme/flex_color_scheme.dart';
// import 'package:tri/app/view/themes/amber_blue.dart';
// import 'package:tri/app/view/themes/espresso_theme.dart';
// import 'package:tri/app/view/themes/forest_theme.dart';
// import 'package:tri/app/view/themes/green_theme.dart';
// import 'package:tri/app/view/themes/midnight_theme.dart';
import 'package:tri/app/view/themes/night_theme.dart';
// import 'package:tri/app/view/themes/stone_theme.dart';
// import 'package:tri/app/view/themes/veridian_theme.dart';

void main() {
  runApp(ProviderScope( 
    child: CalendarControllerProvider<Object?>(controller: EventController(), child: const MyApp()))
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
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
      theme: NightTheme.light,
      // darkTheme: AmberBlue.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: EspressoTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: ForestTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      darkTheme: NightTheme.dark
        .copyWith(iconTheme: IconThemeData(color: Color(0xFF004E5D)),),
        // buttonTheme: ButtonThemeData()),
      // darkTheme: StoneTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: VeridianTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: MidnightTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: GreenTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: StoneTheme.dark,
      themeMode: _themeMode,
      home: TriApp(title: 'TRI', onThemeModeChange: _toggleTheme),
    );
  }
}
