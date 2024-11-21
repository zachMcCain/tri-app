import 'package:flutter/material.dart';
import 'package:tri/app/models/workout_models/segments/abstract_segment.dart';
import 'package:tri/app/models/workout_models/abstract_workout.dart';
import 'package:tri/app/view/workout/workout_segment_view.dart';

class WorkoutSegmentList extends StatefulWidget {
  final AbstractWorkout workout;

  const WorkoutSegmentList({super.key, required this.workout});

  @override
  State<WorkoutSegmentList> createState() => _WorkoutSegmentListState();
}

class _WorkoutSegmentListState extends State<WorkoutSegmentList> {
  void _updateList(oldIndex, newIndex) {
    AbstractSegment seg = widget.workout.segments[oldIndex];
    widget.workout.segments.remove(seg);
    if (newIndex >= widget.workout.segments.length) {
      widget.workout.segments.add(seg);
    } else {
      widget.workout.segments.insert(newIndex, seg);
    }
  }

  void _removeEntry(int index) {
    setState(() {
      widget.workout.segments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ReorderableListView(
        onReorder: (oldIndex, newIndex) => {
          setState(() {
            _updateList(oldIndex, newIndex);
          })
        },
        children: [
          ...widget.workout.segments
            .asMap()
            .map((index, segment) => MapEntry(index, WorkoutSegmentView(key: ValueKey(segment), segment: segment, onRemove: () => _removeEntry(index)))).values
        ],
      ),
    );
  }
}