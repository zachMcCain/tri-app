
import 'package:flutter/material.dart';
import 'package:tri/app/view/view_picker/abstract_view_tile.dart';

enum WorkoutPickerMode { type, workout }

/// This is just a placeholder for the idea of having a cascading stack - perhaps Stack is not the best class for this as it just straight up stacks them
class ViewPicker extends StatelessWidget {

  final List<AbstractViewTile> tiles;

  const ViewPicker({super.key, required this.tiles});

  @override
  Widget build(BuildContext context) {


    return ListView(
      children: tiles.map((tile) => 
        ListTile(
            leading: tile.icon,
            title: Text(tile.title),
            trailing: tile.trailing,
            tileColor: Theme.of(context).cardColor,
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => tile.onTap()))
            },
          ),
        )
      .toList());
  }
}