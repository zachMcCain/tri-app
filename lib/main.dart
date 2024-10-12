import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
import 'package:tri/app/view/home/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tri/app/view/view_picker/view_picker.dart';

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
    return MaterialApp(
      title: 'TRI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TRI',),
    );
  }
}
