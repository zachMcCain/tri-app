import 'package:tri/app/models/interfaces/visitor.dart';
import 'package:uuid/uuid.dart';

abstract class AbstractSegment {
  final String _id = const Uuid().v1();
  void accept(Visitor v) => v.visit(this);
  String getDisplayValue();
}