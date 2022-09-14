import 'package:flutter/material.dart';

import '../models/scramble.dart';

class ViewsModel with ChangeNotifier {
  int _selectedIndex = 0;
  Scramble _scramble = Scramble();

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }

  Scramble get scramble => _scramble;
  set scrambe(Scramble scra){
    _scramble = scra;
    //notifyListeners();
  }

  void changePage(int index){
    _selectedIndex = index;
    notifyListeners();    
  }

  
}