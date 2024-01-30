import 'package:cube_timer/models/matrix.dart';
import 'package:cube_timer/models/scramble.dart';
import 'package:flutter/material.dart';

import '../models/matrix_cube.dart';
import 'package:provider/provider.dart';
import '../providers/views_provider.dart';
import 'cube.dart';
import 'test_cube.dart';


class PageViewAnimated extends StatefulWidget {
  
  //List<Widget> views;
  final PageController pageController;

  PageViewAnimated({
    //required this.views,
    required this.pageController,
  });
  
  @override
  State<PageViewAnimated> createState() => _PageViewAnimatedState();
}

class _PageViewAnimatedState extends State<PageViewAnimated> {

  @override
  Widget build(BuildContext context) {
    Scramble scr = Scramble();
    List<Widget> views = [
      CubeTest(matr:  MatrixCube(Type.cube3x3) , n: nCubeType[Type.cube3x3]!),
      Cube(scramble: scr, deviceSize: 40),
      Container(color: Colors.black,)
    ];
    return PageView(
      physics: const ClampingScrollPhysics(),
      controller: widget.pageController,
      onPageChanged: (index) {
        context.read<ViewsModel>().changePage(index);
      },
      padEnds: false,
      children: views,
    );
  }
}