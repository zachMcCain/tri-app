import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/segments/abstract_segment.dart';
import 'package:tri/app/models/workout_models/segments/distance.dart';

class WorkoutSegmentView extends StatelessWidget {
  final AbstractSegment segment;
  final bool removable;
  final void Function() onRemove;
  final int index;

  const WorkoutSegmentView({super.key, required this.segment, required this.onRemove, this.removable = false, required this.index});

  Widget getSegmentView() {
    if (segment is Distance) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text('${index + 1}.  '),
            Text(segment.getDisplayValue()),
            const Text(' '),
            Text((segment as Distance).getPaceDisplay()),
            const Text(' pace')
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(segment.getDisplayValue()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          getSegmentView(),
          removable ? Expanded(
            child: Align(alignment: Alignment.centerRight, child: TextButton(onPressed: onRemove, child: Text('Remove Segment')))
          ) : Container()
        ],
      ),
    );
  }
}