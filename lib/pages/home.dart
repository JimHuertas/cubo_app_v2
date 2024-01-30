import 'package:cube_timer/providers/category_cube_provider.dart';
import 'package:cube_timer/widgets/test_side_menu_drawer.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:cube_timer/models/scramble.dart';
import 'package:cube_timer/widgets/pageViewAnimatedHome.dart';
import 'package:cube_timer/widgets/appbarHome.dart';
import 'package:cube_timer/widgets/bottomnavigationbar_home.dart';
import '../providers/views_provider.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); //To Open Drawer with Appbar
  final Color colorTheme = Colors.black;
  final Scramble scramble = Scramble();
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    final double width = MediaQuery.of(context).size.width;
    //final double height = MediaQuery.of(context).size.height;
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViewsModel()),
        ChangeNotifierProvider(create: (_) => CategoryCubeModel())
      ],
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: colorTheme,
        appBar: AppBarHome(
          colorTheme: colorTheme,
          widthDevice: width,
          scaffoldKey: _scaffoldKey,
          //typeCube: Type.values,
        ),
        body: PageViewAnimated(
          //views: views,
          pageController: pageController,
        ),
        bottomNavigationBar: BottomNavigationBarHome(
          colorTheme: colorTheme,
          pageController: pageController,
        ),
        drawer: DrawerHomeTwo(),
      ),
    );
  }
}