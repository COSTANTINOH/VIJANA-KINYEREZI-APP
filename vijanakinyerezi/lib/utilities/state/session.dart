import 'package:flutter/material.dart';

class Session extends ChangeNotifier {
  bool _success = false;

  bool get getSessionState => _success;

  void setSessionState({required bool state}) {
    _success = state;
    notifyListeners();
  }
}
