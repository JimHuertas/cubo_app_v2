import 'package:cube_timer/models/matrix.dart';
import 'package:cube_timer/widgets/test_cube.dart';
import 'package:flutter/material.dart';

import 'package:cube_timer/models/scramble.dart';

import 'package:cube_timer/widgets/cube.dart';
import 'package:cube_timer/widgets/pageViewAnimatedHome.dart';
import 'package:cube_timer/widgets/appbarHome.dart';
import 'package:cube_timer/widgets/bottomnavigationbar_home.dart';
import 'package:cube_timer/widgets/drawerHome.dart';
import '../models/matrix_cube.dart';
import '../providers/views_provider.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); //To Open Drawer with Appbar
  final Scramble scramble = Scramble();
  final Color colorTheme = Colors.black;
  
  @override
  Widget build(BuildContext context) {
    List<Widget> views = [
      Cube(context: context, scramble: scramble, deviceSize: 100),
      CubeTest(matr:  MatrixCube(Type.cube3x3) , n: nCubeType[Type.cube3x3]!),
      Container(color: Colors.red,),
    ];
    
    PageController pageController = PageController();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViewsModel())
      ],
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: colorTheme,
        appBar: AppBarHome(
          colorTheme: colorTheme,
          widthDevice: width,
          scaffoldKey: _scaffoldKey,
        ),
        body: PageViewAnimated(
          views: views,
          pageController: pageController,
        ),
        bottomNavigationBar: BottomNavigationBarHome(
          colorTheme: colorTheme,
          pageController: pageController,
        ),
        drawer: DrawerHome(),
      ),
    );
  }
}