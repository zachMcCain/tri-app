import 'package:flutter/material.dart';

abstract class AbstractViewTile {
  String get title;
  IconData? get icon;
  Icon? get trailing;

  Widget onTap(Function(Object val) callback);
  
}