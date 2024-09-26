import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CurrentView {
  home,
  calendar,
  workoutCreator,
  workoutBank,
  dataViz
}

class ViewModel extends ChangeNotifier {
  CurrentView _view = CurrentView.home;

  set view(CurrentView view) {
    _view = view;
    notifyListeners();
  }

  CurrentView get view {
    return _view;
  }
}

final view = ChangeNotifierProvider<ViewModel>((ref) => ViewModel());


