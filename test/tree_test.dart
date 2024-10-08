
import 'package:flutter_test/flutter_test.dart';
import 'package:tri/app/models/tree/workout_tree.dart';
import 'package:tri/app/models/workout_models/run.dart';

void main() {
  test('Tests tree functionality', () {
    WorkoutTree tree = WorkoutTree();
    Run run1 = Run(const Duration(hours: 1), 123, DateTime.now());
    tree.insert(run1);

    expect(tree.contains(run1.id), true);

    Run run2 = Run(const Duration(hours: 2), 133, DateTime.now());
    Run run3 = Run(const Duration(hours: 3), 143, DateTime.now());
    tree.insert(run2);
    tree.insert(run3);

    expect(tree.contains(run3.id), true);
    expect(tree.contains(run2.id), true);

    tree.delete(run2);

    expect(tree.contains(run2.id), false);
    expect(tree.contains(run3.id), true);
    expect(tree.contains(run1.id), true);

    tree.delete(run3);
    expect(tree.contains(run2.id), false);
    expect(tree.contains(run3.id), false);
    expect(tree.contains(run1.id), true);

    tree.delete(run1);
    expect(tree.contains(run2.id), false);
    expect(tree.contains(run3.id), false);
    expect(tree.contains(run1.id), false);
  });
}