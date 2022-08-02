import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../pages/home.dart';


class BottomNavigationBarHome extends StatefulWidget {

  int selectedIndex;
  PageController pageController;

  BottomNavigationBarHome({
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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(                                           
          topRight: Radius.circular(20), 
          topLeft: Radius.circular(20)
        ),
      ),
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
        currentIndex: Provider.of<ViewsModel>(context).selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(67, 76, 76, 76),
        iconSize: 25.0,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.red,
        showSelectedLabels: false,
        showUnselectedLabels: false,
    
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline_sharp),
            label: '',
          ),
        ],
    );
  }
  _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      widget.pageController.addListener(() { 
        Provider.of<ViewsModel>(context, listen: false).selectedIndex = widget.selectedIndex;
      });
      widget.pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500), 
        curve: Curves.easeOut
      );
    });
  }
}




