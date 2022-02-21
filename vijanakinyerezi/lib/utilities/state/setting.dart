import 'package:flutter/widgets.dart';
import 'package:vijanakinyerezi/utilities/localstorage/shared/local_storage.dart';

class AppSettingService with ChangeNotifier {
  List<String> _sortname = [];
  List<String> get sortnameList => _sortname;

  void setSortName(List<String> sortname) {
    _sortname = sortname;
    notifyListeners();
  }

  //set true and false for Loading Widget
  bool loading = false;
  bool get isLoading => loading;
  setloading(bool value) {
    loading = value;
    notifyListeners();
  }

  static var accessToken = LocalStorage.getStringItem("accessToken");
}
