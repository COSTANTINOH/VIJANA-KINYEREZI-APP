import 'package:flutter/cupertino.dart';

class IndexMenuBloc extends ChangeNotifier {
  int _index = 0;

  int get currentIndex => _index;

  void setIndex(int index) {
    int newIndex = index;
    if (_index == newIndex) {
      _index = newIndex;
    } else {
      _index = index;
      notifyListeners();
    }
  }
}
