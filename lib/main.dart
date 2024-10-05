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
      home: const MyHomePage(title: 'TRI',), //MyFakeHome()//
    );
  }
}



///// PLAYGROUND



// final myFakeCounter = ChangeNotifierProvider<FakeWorkoutModel>((ref) =>  FakeWorkoutModel()); // This is what provides the state to the WidgetRef - can live in another file (does it auto pickup everything that is a ChangeNotifierProvider??) - the model it returns needs to extend ChangeNotifier

// class MyFakeHome extends ConsumerWidget /**ConsumerWidget is what gives access to the ref */ {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var value = ref.watch(myFakeCounter).counter;
//     // TODO: implement build
//     return Scaffold(
//       body: Center(
//         child: Text('Value: $value',
//         style: Theme.of(context).textTheme.headlineLarge,),
//       ),
//       floatingActionButton: Padding(
//         padding: EdgeInsets.only(left: 30),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             FloatingActionButton(
//               onPressed: () => ref.read(myFakeCounter.notifier).addCounter(),
//               child: Icon(Icons.add),
//             ),
//             Expanded(child: Container(),),
//             FloatingActionButton(
//               onPressed: () => ref.read(myFakeCounter.notifier).subtractCounter(),
//               child: Icon(Icons.remove),
//             )
//           ],),),
//     );
//   }
// }