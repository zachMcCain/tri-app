
import 'package:flutter/material.dart';
import 'package:tri/app/view/view_picker/abstract_result_widget.dart';
import 'package:tri/app/view/view_picker/abstract_view_tile.dart';

enum WorkoutPickerMode { type, workout }

class ViewPicker extends StatefulWidget {

  final List<AbstractViewTile> tiles;
  final bool insert;

  const ViewPicker({super.key, required this.tiles, required this.insert});

  @override
  State<ViewPicker> createState() => _ViewPickerState();
}

class _ViewPickerState extends State<ViewPicker> {

  List<Widget> additionalView = List.empty(growable: true);
  List<Widget> tileView = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {

    List<Widget> tileView = widget.tiles.map((tile) => 
        ListTile(
            leading: tile.icon,
            title: Text(tile.title),
            trailing: tile.trailing,
            tileColor: Theme.of(context).cardColor,
            onTap: () {
              if (!widget.insert) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => tile.onTap((v) {})));
              } else {
                // setState(() {
                  Object? result;
                  Widget form = tile.onTap((val) {result = val;});

                  // Should actually pop out the form field and then insert the result of the input
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            form,
                            const SizedBox(height: 15),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, result);
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                      )
                    ),
                  ).then((someResult) {
                    print("Retrieved a result of $someResult");
                    if (someResult != null) {
                      setState(() {
                        
                        additionalView.add(ListTile(
                          leading: tile.icon,
                          title: Text(someResult.toString()),
                          trailing: tile.trailing
                        ));
                      });
                    }
                  });

                //   // Instead of the widget, we should be adding a row field with a title based on the 
                //   // tile.title and a value of the result of the future here.
                //   // additionalView.add(tile.onTap());
                // })
              }
            },
          ),
        )
      .toList();

    List<Widget> view = additionalView.map((v) => v).toList(); // clone the additionalView
    view.addAll(tileView);
    return ListView(
      shrinkWrap: true,
      children: view
    );
  }
}