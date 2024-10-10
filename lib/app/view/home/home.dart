import 'package:flutter/material.dart';
import 'package:tri/app/models/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tri/app/models/workout_models/workout_type.dart';
import 'package:tri/app/view/forms/workout_form.dart';
import 'package:tri/app/view/view_picker/view_picker.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CurrentView currentView = ref.watch(view).view;

    Widget getCurrentView() {
      if (currentView == CurrentView.calendar) {
        return CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2050), onDateChanged: (change) => print("Hi"));
      } else if (currentView == CurrentView.home) {
        return Home();
      } else if (currentView == CurrentView.workoutCreator) {
        return const WorkoutForm(workoutType: WorkoutType.run,);
      } else if (currentView == CurrentView.workoutBank) {
        return const ViewPicker(tiles: WorkoutType.values,);
      }
      return Home();
      
    }

    Widget currentPage = getCurrentView();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(title),
        actions: [
          IconButton(onPressed: () => ref.read(view).view = CurrentView.home, icon: const Icon(Icons.home), tooltip: "Home",),
          IconButton(onPressed: () => ref.read(view).view = CurrentView.workoutCreator, icon: const Icon(Icons.run_circle), tooltip: "Build Workout",),
          IconButton(onPressed: () => ref.read(view).view = CurrentView.calendar, icon: const Icon(Icons.calendar_month), tooltip: "Plan",),
          IconButton(onPressed: () => ref.read(view).view = CurrentView.workoutBank, icon: const Icon(Icons.list), tooltip: "View Workouts",),
        ]
      ),
      body: currentPage,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {print("hello")},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
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
