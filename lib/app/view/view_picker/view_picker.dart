
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
            // border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).dialogBackgroundColor
          ),
          child: GridTile(
            header: Text(
              tile.title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            
            child: Icon(tile.icon!, color: Theme.of(context).iconTheme.color),
          ),
        ),
      ),
    )
    .toList();

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GridView.count(
        crossAxisCount: tileView.length > 3 ? 3 : tileView.length,
        shrinkWrap: true,
        children: tileView
      ),
    );
  }
}