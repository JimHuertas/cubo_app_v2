import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../pages/home.dart';


class BottomNavigationBarHome extends StatefulWidget {

  int selectedIndex;
  PageController pageController;
  Color colorTheme;

  BottomNavigationBarHome({
    required this.colorTheme,
    required this.pageController,
    required this.selectedIndex
  });

  @override
  State<BottomNavigationBarHome> createState() => _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.colorTheme,
      height: 42,
      child: ClipRRect(     
        borderRadius: const BorderRadius.only(                                           
          topLeft: Radius.circular(20.0),                                            
          topRight: Radius.circular(20.0),                                           
        ),
        child: _navigationBarTimer()
      )
    );
  }

    _navigationBarTimer() {
    return BottomNavigationBar(
        //elevation: 0.0,
        //type: BottomNavigationBarType.fixed,
        currentIndex: Provider.of<ViewsModel>(context).selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(67, 76, 76, 76),
        iconSize: 24.0,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        selectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              width: 100,
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(0.0),
              child: Icon(Icons.timer_outlined)
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              width: 100,
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(0.0),
              child: Icon(Icons.list_alt, )
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              width: 100,
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(0.0),
              child: Icon(Icons.timeline_sharp)),
            label: '',
          ),
        ],
    );
  }
  _onItemTapped(int index) {
      widget.selectedIndex = index;
      widget.pageController.addListener(() { 
        Provider.of<ViewsModel>(context, listen: false).selectedIndex = widget.selectedIndex;
      });
      //print(widget.selectedIndex);
      widget.pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 100), 
        curve: Curves.bounceOut
      );
  
  }
}




