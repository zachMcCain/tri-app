
import 'package:flutter/material.dart';
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
            onTap: () => {
              if (!widget.insert) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => tile.onTap()))
              } else {
                setState(() {
                  additionalView.add(tile.onTap());
                })
              }
            },
          ),
        )
      .toList();

    List<Widget> view = additionalView.map((v) => v).toList(); // clone the additionalView
    view.addAll(tileView);
    return ListView(
      children: view
    );
  }
}