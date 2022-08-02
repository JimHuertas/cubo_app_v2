import 'package:cube_timer/widgets/cube.dart';
import 'package:flutter/material.dart';

import 'package:cube_timer/models/scramble.dart';

import 'package:cube_timer/widgets/pageViewAnimatedHome.dart';
import 'package:cube_timer/widgets/appbarHome.dart';
import 'package:cube_timer/widgets/bottonNavigationBarHome.dart';
import 'package:cube_timer/widgets/drawerHome.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); //To Open Drawer with Appbar
  final Scramble scramble = Scramble();
  final Color colorTheme = Colors.lightBlueAccent;
  
  @override
  Widget build(BuildContext context) {
    List<Widget> views = [
      cube(context, scramble),
      Container(color: Colors.red,),
      Container(color: Colors.yellow,)
    ];

    int selectedIndex = 0;
    PageController pageController = PageController();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (_) => ViewsModel(),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: colorTheme,
        appBar: AppBarHome(//Own Widget
          widthDevice: width,
          scaffoldKey: _scaffoldKey,
        ),
        body: PageViewAnimated(
          views: views,
          pageController: pageController,
          selectedIndex: selectedIndex,
        ),
        bottomNavigationBar: BottomNavigationBarHome(
          pageController: pageController,
          selectedIndex: selectedIndex,
        ),//Own Widget
        floatingActionButton: FloatingActionButton(
          onPressed: ((){ 
            setState(() {scramble.generarScramble(3);});
          }),
        ),
        drawer: DrawerHome(),
      ),
    );
  }
}

class ViewsModel with ChangeNotifier {
  int _selectedIndex = 0;
  // final Color _colorSelected = Colors.white;
  // final Color _colorUnselected = Colors.red;

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }
  
}