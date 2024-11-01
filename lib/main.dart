import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'TRI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        // colorSchemeSeed: const Color(0xFF63A002),
        primaryColorDark: const Color(0xFF63A002),
        primaryColor: const Color(0xFF63A002),
        // secondaryHeaderColor: const Color(0xFF63A002)
        primaryTextTheme: Typography.blackCupertino
        // primaryIconTheme: IconThemeData()
      ),
      home: const MyHomePage(title: 'TRI',),
    );
  }
}
