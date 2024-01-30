import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cube_timer/models/matrix_cube.dart';
import 'package:cube_timer/providers/category_cube_provider.dart';

class CubeTest extends StatefulWidget {

  final MatrixCube matr;
  final int n;
  const CubeTest({
    required this.matr,
    required this.n,
    super.key});

  @override
  State<CubeTest> createState() => _CubeTestState();
}

class _CubeTestState extends State<CubeTest> {
  @override
  Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 20, left:15, right: 15, bottom: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.read<CategoryCubeModel>().changeScramble(3);
            },
            child: Text(
              context.watch<CategoryCubeModel>().scramble, 
              style: const TextStyle(color: Colors.white, fontSize: 25.0)
            )
          ),
          _generateCube(3),
          Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('asd', style: TextStyle(fontSize: 18, color: Colors.white)),
              //_generateCube(3),
              const Text('data', style: TextStyle(fontSize: 18, color: Colors.white))
            ],
          ),
        ]
      ),
    );
  }

  _generateCube(double width){
    return GestureDetector(
      onTap: (){print("aqui gesto xd");},
      child: Row(
        children: <Widget>[
          _columOfFace(false, 1),
          SizedBox(width: width),
          _columOfFace(true, 0),
          SizedBox(width: width),
          _columOfFace(false, 3),
          SizedBox(width: width),
          _columOfFace(false, 4),
        ],
      ),
    );
  }

  _columOfFace(bool isMiddleRow, int i){
    return Column(
      children: <Widget>[
        (isMiddleRow) 
          ? _unitOfFace(Colors.black, 0) 
          : const SizedBox(width: 20, height: 20,),
        const SizedBox(height: 3),
        _unitOfFace(Colors.black, (isMiddleRow) ? 2 : i),
        const SizedBox(height: 3),
        (isMiddleRow) 
          ? _unitOfFace(Colors.black, 5) 
          : const SizedBox(width: 20, height: 20,),
      ],
    );
  }

  ///Render to a face of cube depending of the color(i) gave in parameters
  _unitOfFace(Color color, int i){
    double cubeTam = 85;
    return Container(
      alignment: Alignment.topLeft,
      color: color, 
      width: cubeTam, 
      height: cubeTam,
      child: Row(
      children: [
        Column(
          children: [
            _cubeOne(cubeTam,i,0,0),
            SizedBox(height: cubeTam*(1/50)),
            _cubeOne(cubeTam,i,1,0),
            SizedBox(height: cubeTam*(1/50)),
            _cubeOne(cubeTam,i,2,0),
          ],
        ),
        SizedBox(width: cubeTam*(1/50)),
        Column(
          children: [
            _cubeOne(cubeTam,i,0,1),
            SizedBox(height: cubeTam*(1/50)),
            _cubeOne(cubeTam,i,1,1),
            SizedBox(height: cubeTam*(1/50)),
            _cubeOne(cubeTam,i,2,1),
          ],
        ),
        SizedBox(width: cubeTam*(1/50)),
        Column(
          children: [
            _cubeOne(cubeTam,i,0,2),
            SizedBox(height: cubeTam*(1/50)),
            _cubeOne(cubeTam,i,1,2),
            SizedBox(height: cubeTam*(1/50)),
            _cubeOne(cubeTam,i,2,2),
          ],
        ),
      ],
    ),
      
    );
  }

  _cubeOne(double cubeTam, int pos, int i, int j){
    int typeColor = context.read<CategoryCubeModel>().cube.numPos(pos, i, j);
    // MatrixCube mtr = context.read<CategoryCubeModel>().cube;
    return Container(
      width: cubeTam*(32/100),
      height: cubeTam*(32/100),
      color:  _numToColor(typeColor),
      // child: Center(
      //   child: Column(
      //     children: <Widget>[
      //       Text("$i - $j", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
      //       Text(pos.toString(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      //     ],
      //   ),
      // )  
    );
  }


  ///Return a respective color of a number in the matrixCube class
  ///0 -> White, 1 -> Orange, 2 -> Green, 3 -> Red, 4 -> Blue, 5 -> Yellow, 
  Color _numToColor(int num){
    switch (num) {
      case 0:
        return Colors.white;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.green;
      case 3:
        return Colors.red;
      case 4:
        return Colors.blue;
      case 5:
        return Colors.yellow;
      default:
        return Colors.blue;
    }
  }
}