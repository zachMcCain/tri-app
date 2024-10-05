import 'package:tri/app/models/tree/node.dart';
import 'package:tri/app/models/workout_models/workout_model.dart';
import 'package:uuid/uuid.dart';

class WorkoutNode extends Node<WorkoutModel>{
  
  @override
  Node<WorkoutModel>? leftNode;
  
  @override
  Node<WorkoutModel>? rightNode;

  @override
  void insert(WorkoutModel data) {
    if (this.data == null) {
      this.data = data;
    } else if (this.data!.startTime.isAfter(data.startTime)) {
      leftNode ??= WorkoutNode();
      leftNode!.insert(data);
    } else {
      rightNode ??= WorkoutNode();
      rightNode!.insert(data);
    }
  }

  @override
  bool contains(WorkoutModel data) {
    return this.data?.getId() == data.getId() || 
      rightNode?.getData()?.getId() == data.getId() || 
      leftNode?.getData()?.getId() == data.getId();
  }

  @override
  WorkoutModel getDataById(Uuid id) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }

  @override
  bool delete(WorkoutModel data) {
    // TODO: implement delete
    throw UnimplementedError();
  }


}