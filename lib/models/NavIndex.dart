import 'package:flutter/widgets.dart';

class NavIndex with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void changeIndex(int index) {
    this._index = index;
    notifyListeners();
  }
}
