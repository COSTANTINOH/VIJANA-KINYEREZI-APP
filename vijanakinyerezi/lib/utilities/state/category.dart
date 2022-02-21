import 'package:flutter/material.dart';

class CategoryIdBloc extends ChangeNotifier {
  String _categoryId = '';
  int _index = 1;

  String get getCategoryIdData => _categoryId;

  int get getCurrentIndex => _index;

  void setCategoryIdData(var categoryId, var index) {
    _categoryId = categoryId;
    _index = index;
    notifyListeners();
  }

  void unsetCategoryId() {
    _categoryId = '';
    notifyListeners();
  }

  void unsetCurrentIndex() {
    _index = 0;
    notifyListeners();
  }
}
