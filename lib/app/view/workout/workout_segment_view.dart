import 'package:flutter/material.dart';
import 'package:tri/app/models/workout/abstract_segment.dart';
import 'package:tri/app/models/workout/distance.dart';

class WorkoutSegmentView extends StatelessWidget {
  final AbstractSegment segment;
  final void Function() onRemove;

  const WorkoutSegmentView({super.key, required this.segment, required this.onRemove});

  Widget getSegmentView() {
    if (segment is Distance) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
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
          const Icon(Icons.menu),
          // const Text('-'),
          getSegmentView(),
          Expanded(child: Align(alignment: Alignment.centerRight, child: TextButton(onPressed: onRemove, child: const Text('Remove Segment'))))
        ],
      ),
    );
  }
}