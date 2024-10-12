import 'package:flutter/material.dart';
import 'package:tri/app/models/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
import 'package:tri/app/view/forms/workout_form.dart';
import 'package:tri/app/view/view_picker/view_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> views = [
    Home(),
    const Material(child: ViewPicker(tiles: WorkoutType.values)),
    Material(child: CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2050), onDateChanged: (change) => print("Hi"))),
  ];

  int _selectedIndex = 0;

  Widget getCurrentView() {
    return views.elementAt(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
        
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedIndex: _selectedIndex,
        // title: Text(title),
        destinations: const <Widget>[
          NavigationDestination(icon: Badge(child: Icon(Icons.home)), label: "Home"),
          NavigationDestination(icon: Badge(child: Icon(Icons.run_circle),), label: "Build Workout"),
          NavigationDestination(icon: Badge(child: Icon(Icons.calendar_month)), label: "Log"),
        ],
        onDestinationSelected: (int index) => {
          setState(() {
            _selectedIndex = index;
          })
        },
      ),
      body: getCurrentView()
    );


  }
}

class Home extends StatelessWidget {
  Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            'home',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
