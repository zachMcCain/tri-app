import 'package:tri/app/models/tree/node.dart';
import 'package:tri/app/models/tree/workout_node.dart';
import 'package:tri/app/models/workout_models/workout_model.dart';

class WorkoutTree {
  Node<WorkoutModel>? root;

  WorkoutTree();

  void insert(WorkoutModel data) {
    if (root == null) {
      root = WorkoutNode(data);
    } else {
      root!.insert(data);
    }
  }

  bool delete(WorkoutModel data) {
    if (root == null) {
      return false;
    }
    if (root!.data.getId() == data.id) {
      if (root!.leftNode == null && root!.rightNode == null) {
        root = null;
      } else if (root!.leftNode == null) {
        root = root!.rightNode;
      } else {
        root = root!.leftNode;
      }
      return true;
    } else {
      return root!.deleteChild(data);
    }
  }

  bool contains(String id) {
    return root?.data.getId() == id || (root != null && root!.contains(id));
  }

  List<WorkoutModel> getOrderedData() {
    if (root == null) {
      return List.empty();
    }
    return root!.getOrderedData();
  }
}