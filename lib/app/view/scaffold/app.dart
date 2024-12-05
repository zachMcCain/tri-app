import 'package:flutter/material.dart';
import 'package:tri/app/view/home/home.dart';
import 'package:tri/app/view/planner/planner.dart';
import 'package:tri/app/view/workout/workout_builder.dart';

class TriApp extends StatefulWidget {
  final Function(ThemeMode) onThemeModeChange;
  final String title;

  const TriApp({super.key, required this.title, required this.onThemeModeChange});
  
  @override
  State<TriApp> createState() => _TriAppState();
}

class _TriAppState extends State<TriApp> {
  List<Widget> views = [
    const Home(),
    const WorkoutBuilder(),
    const Planner()
  ];

  int _selectedIndex = 0;

  Widget getCurrentView() {
    return views.elementAt(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    IconData icon = isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined;

    return Container(
      decoration: BoxDecoration(color: Colors.grey[500]),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              backgroundColor: Theme.of(context).colorScheme.primary,
              actions: [
                IconButton(onPressed: () {
                  if (isDarkMode) {
                    widget.onThemeModeChange(ThemeMode.light);
                  } else {
                    widget.onThemeModeChange(ThemeMode.dark);
                  }
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                }, icon: Icon(icon))
              ],
            ),
            bottomNavigationBar: NavigationBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              selectedIndex: _selectedIndex,
              destinations: const <Widget>[
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(icon: Icon(Icons.run_circle), label: "Build Workout"),
                NavigationDestination(icon: Icon(Icons.calendar_month), label: "Log"),
              ],
              onDestinationSelected: (int index) => {
                setState(() {
                  _selectedIndex = index;
                })
              },
            ),
            body: getCurrentView()
          ),
        ),
      ),
    );


  }
}