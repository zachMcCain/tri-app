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
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:tri/app/view/themes/amber_blue.dart';
import 'package:tri/app/view/themes/espresso_theme.dart';
import 'package:tri/app/view/themes/forest_theme.dart';
import 'package:tri/app/view/themes/green_theme.dart';
import 'package:tri/app/view/themes/midnight_theme.dart';
import 'package:tri/app/view/themes/night_theme.dart';
import 'package:tri/app/view/themes/stone_theme.dart';
import 'package:tri/app/view/themes/veridian_theme.dart';

void main() {
  runApp(ProviderScope( 
    child: CalendarControllerProvider<Object?>(controller: EventController(), child: const MyApp()))
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
      theme: NightTheme.light,
      // darkTheme: AmberBlue.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: EspressoTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: ForestTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      darkTheme: NightTheme.dark.copyWith(iconTheme: IconThemeData(color: Color(0xFF004E5D))),
      // darkTheme: StoneTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: VeridianTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: MidnightTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: GreenTheme.dark.copyWith(iconTheme: IconThemeData(color: Colors.amber.shade700)),
      // darkTheme: StoneTheme.dark,
       // The defined light theme.
    // theme: FlexThemeData.light(
    //   scheme: FlexScheme.deepBlue,
    //   subThemesData: const FlexSubThemesData(
    //     interactionEffects: true,
    //     tintedDisabledControls: true,
    //     useM2StyleDividerInM3: true,
    //     inputDecoratorIsFilled: true,
    //     inputDecoratorBorderType: FlexInputBorderType.outline,
    //     alignedDropdown: true,
    //     navigationRailUseIndicator: true,
    //     navigationRailLabelType: NavigationRailLabelType.all,
    //   ),
    //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
    //   cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(applyThemeToAll: true),
    // ),
    // // The defined dark theme.
    // darkTheme: FlexThemeData.dark(
    //   scheme: FlexScheme.deepBlue,
    //   subThemesData: const FlexSubThemesData(
    //     interactionEffects: true,
    //     tintedDisabledControls: true,
    //     blendOnColors: true,
    //     useM2StyleDividerInM3: true,
    //     inputDecoratorIsFilled: true,
    //     inputDecoratorBorderType: FlexInputBorderType.outline,
    //     alignedDropdown: true,
    //     navigationRailUseIndicator: true,
    //     navigationRailLabelType: NavigationRailLabelType.all,
    //   ),
    //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
    //   cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(applyThemeToAll: true),
    // ),
    themeMode: ThemeMode.dark,


      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      //   useMaterial3: true,
      //   scaffoldBackgroundColor: Colors.blueGrey.shade800,
      //   cardColor: Colors.blueGrey.shade900,
      //   inputDecorationTheme: InputDecorationTheme(
      //     fillColor: Colors.grey.shade300
      //   ),
      //   iconTheme: IconThemeData(
      //     color: Colors.amber.shade700
      //   ),
      //   textTheme:  TextTheme(
      //     headlineMedium: TextStyle(
      //       color: Colors.green.shade700
      //     ),
      //     headlineLarge: TextStyle(
      //       color: Colors.white70
      //     ),
      //     headlineSmall: TextStyle(
      //       color: Colors.green.shade800
      //     ),
      //     bodyLarge: TextStyle(
      //       color: Colors.white
      //     ),
      //     bodyMedium: TextStyle(
      //       color: Colors.white,
      //     ),
      //     bodySmall: TextStyle(
      //       color: Colors.white
      //     ),
      //   )
      // ),
      home: const TriApp(title: 'TRI',),
    );
  }
}
