import 'package:flutter/material.dart';
import 'package:tri/app/view/view_picker/abstract_result_widget.dart';

abstract class AbstractViewTile {
  String get title;
  Icon? get icon;
  Icon? get trailing;

  Widget onTap(Function(Object val) callback);
  
}