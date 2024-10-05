import 'package:uuid/uuid.dart';

abstract class Node<T> {
  T? data;
  abstract Node<T>? leftNode;
  abstract Node<T>? rightNode;

  // Should insert the data into the tree
  void insert(T data);

  bool contains(T data);

  T getDataById(Uuid id);

  bool delete(T data);

  List<T> getOrderedData() {
     List<T> orderedData = List.empty();
    leftNode != null ? orderedData.addAll(leftNode!.getOrderedData()) : null;
    data != null ? orderedData.add(data!) : null;
    rightNode != null ? orderedData.addAll(rightNode!.getOrderedData()) : null;
    return orderedData;
  }

  T? getData() {
    return data;
  }

  Node<T>? getLeftNode() {
    return this.leftNode;
  }

  Node<T>? getRightNode() {
    return this.rightNode;
  }

}