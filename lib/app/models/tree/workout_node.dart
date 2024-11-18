import 'package:tri/app/models/tree/node.dart';
import 'package:tri/app/models/workout_models/workout_model.dart';

class WorkoutNode extends Node<WorkoutModel>{
  
  @override
  Node<WorkoutModel>? leftNode;
  
  @override
  Node<WorkoutModel>? rightNode;

  @override
  Node<WorkoutModel>? parent;

  @override
  WorkoutModel data;

  WorkoutNode(this.data);

  @override
  void insert(WorkoutModel data) {
    // if (this.data.startTime.isAfter(data.startTime)) {
    //   if (leftNode != null) {
    //     leftNode!.insert(data);
    //   } else {
    //     leftNode == WorkoutNode(data);
    //   }
    // } else {
    //   if (rightNode != null) {
    //     rightNode!.insert(data);
    //   } else {
    //     rightNode = WorkoutNode(data);
    //   }
    // }
  }

  @override
  bool contains(String id) {
    return data.getId() == id || 
      rightNode != null && rightNode!.contains(id) || // Stack overflow
      leftNode != null && leftNode!.contains(id);
  }

  @override
  WorkoutModel? getDataById(String id) {
    if (data.getId() == id) {
      return data;
    } else if (leftNode != null) {
      if (leftNode!.contains(id)) {
        return leftNode!.getDataById(id);
      }
    } else if (rightNode != null) {
      if (rightNode!.contains(id)) {
        return rightNode!.getDataById(id);
      }
    }
    return null;
  }

  @override
  bool deleteChild(WorkoutModel data) {
    if (rightNode != null && rightNode!.contains(data.id)) {
      // If we're deleting this one's right node
      if (rightNode!.data.id == data.id) {
        if (rightNode!.rightNode == null && rightNode!.leftNode == null) {
          rightNode = null;
        } else if (rightNode!.leftNode == null) {
          rightNode = rightNode!.rightNode;
          rightNode!.setParent(this);
        } else if (rightNode!.rightNode == null) {
          rightNode = rightNode!.leftNode;
          rightNode!.setParent(this);
        } else {
          replace(rightNode!, rightNode!.leftNode!.getRightmostLeaf());
        }
      } else {
        return rightNode!.deleteChild(data);
      }
      return true;
    } else if (leftNode != null && leftNode!.contains(data.id)) {
      // If we're deleting this one's left child
      if (leftNode!.data.id == data.id) {

        if (leftNode!.rightNode == null && leftNode!.leftNode == null) {
          leftNode = null;
        } else if (leftNode!.leftNode == null) {
          leftNode = leftNode!.rightNode;
          leftNode!.setParent(this);
        } else if (leftNode!.rightNode == null) {
          leftNode = leftNode!.leftNode;
          leftNode!.setParent(this);
        } else {
          replace(leftNode!, leftNode!.rightNode!.getRightmostLeaf());
        }
      } else {
        return leftNode!.deleteChild(data);
      }
      return true;
    }

    return false;
  }

  void deleteSelf() {
    if (leftNode == null && rightNode == null) {

    }
  }

  @override
  Node<WorkoutModel> getRightmostLeaf() {
    if (rightNode != null) {
      return rightNode!.getRightmostLeaf();
    } else {
      return this;
    }
  }

  @override
  void replace(Node<WorkoutModel> child, Node<WorkoutModel> replacement) {
    if (rightNode != null && child.data.getId() == rightNode!.data.getId()) {
      rightNode = replacement;
    } else if (leftNode != null && child.data.getId() == leftNode!.data.getId()) {
      leftNode = replacement;
    } else {
      return;
    }
    replacement.parent?.deleteChild(replacement.data);
    replacement.rightNode = child.rightNode;
    replacement.leftNode = child.leftNode;
    replacement.parent = this;
    child.leftNode = null;
    child.rightNode = null;
  }


}