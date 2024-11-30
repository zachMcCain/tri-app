
import 'package:flutter/material.dart';
import 'package:tri/app/view/view_picker/abstract_view_tile.dart';

/// Widget used for building a grid of selectable options that when selected 
/// will replace the view with the result of the onTap method
/// Typically nested inside another component
class ViewPicker extends StatefulWidget {

  final List<AbstractViewTile> tiles;
  final ValueChanged<Object>? onChanged;

  const ViewPicker({super.key, required this.tiles, this.onChanged});

  @override
  State<ViewPicker> createState() => _ViewPickerState();
}

class _ViewPickerState extends State<ViewPicker> {

  List<Widget> tileView = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {

    List<Widget> tileView = widget.tiles.map((tile) => 
      Listener(
        onPointerUp: (event) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => tile.onTap((v) {})))
              .then((result) {
                if (result != null) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(result);
                  }
                }
              });
            },
        child: Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          child: GridTile(
            header: Text(
              tile.title,
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            child: Icon(tile.icon!),
          ),
        ),
      ),
    )
    .toList();

    return Container(
      color: Colors.grey[300],
      child: GridView.count(
        crossAxisCount: tileView.length > 3 ? 3 : tileView.length,
        shrinkWrap: true,
        children: tileView
      ),
    );
  }
}