import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeBloc extends ChangeNotifier {
  Brightness _brightness = SchedulerBinding.instance!.window.platformBrightness;

  Brightness get brightness => _brightness;

  void setBrightness(Brightness brightness) {
    Brightness _newBrightness = brightness;
    if (_newBrightness == _brightness) {
      _brightness = _newBrightness;
    } else {
      _brightness = brightness;
      notifyListeners();
    }
  }
}
