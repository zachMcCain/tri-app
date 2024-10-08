
abstract class Node<T> {
  abstract T data;
  abstract Node<T>? leftNode;
  abstract Node<T>? rightNode;
  abstract Node<T>? parent;

  // Should insert the data into the tree
  void insert(T data);

  bool contains(String id);

  T? getDataById(String id);

  bool deleteChild(T data);

  Node<T> getRightmostLeaf();

  void replace(Node<T> child, Node<T> replacement);

  Node<T>? getParent() {
    return parent;
  }

  void setParent(Node<T> parent) {
    this.parent = parent;
  }

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