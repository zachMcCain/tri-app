import 'package:flutter/material.dart';

abstract class AbstractViewTile {
  String get title;
  Icon? get icon;
  Icon? get trailing;

  Widget onTap(Function(Object val) callback);
  
}