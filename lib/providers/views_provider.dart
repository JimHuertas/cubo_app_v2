import 'package:flutter/material.dart';

class ViewsModel with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }

  void changePage(int index){
    _selectedIndex = index;
    notifyListeners();    
  }

}