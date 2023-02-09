// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/views_provider.dart';


class BottomNavigationBarHome extends StatefulWidget {

  PageController pageController;
  Color colorTheme;

  BottomNavigationBarHome({
    required this.colorTheme,
    required this.pageController,
  });

  @override
  State<BottomNavigationBarHome> createState() => _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      left: true,
      child: Container(
        color: widget.colorTheme,
        height: 42,
        child: ClipRRect(     
          borderRadius: const BorderRadius.only(                                           
            topLeft: Radius.circular(20.0),                                            
            topRight: Radius.circular(20.0),                                           
          ),
          child: _navigationBarTimer()
        )
      ),
    );
  }

    _navigationBarTimer() {
    return BottomNavigationBar(
        //elevation: 0.0,
        //type: BottomNavigationBarType.fixed,
        currentIndex: context.watch<ViewsModel>().selectedIndex,
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
              //color: Colors.red,
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
              child: const Icon(Icons.timeline_sharp)),
            label: '',
          ),
        ],
    );
  }
  _onItemTapped(index) {
      context.read<ViewsModel>().changePage(index);
      widget.pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 100), 
        curve: Curves.bounceOut
      );
  
  }
}




