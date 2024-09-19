import 'package:flutter/material.dart';

class Nav extends AppBar {
  Nav({super.key});

  AppBar build(BuildContext context) {
    return AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("TRI"),
        actions: [
          IconButton(onPressed: () => print("take me home"), icon: Icon(Icons.home)),
          IconButton(onPressed: () => print("I wanna log stuff"), icon: Icon(Icons.calendar_month))
        ]
      );
  }
}