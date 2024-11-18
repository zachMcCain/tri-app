import 'package:flutter/material.dart';

abstract class ResultWidget<T> extends StatefulWidget {
  const ResultWidget({super.key});

  T? getResult();
}