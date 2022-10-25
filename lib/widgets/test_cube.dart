import 'package:cube_timer/models/matrix_cube.dart';
import 'package:flutter/material.dart';

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
    padding: EdgeInsets.only(top: 20, left:15, right: 15, bottom: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('asd', style: TextStyle(fontSize: 18, color: Colors.white)),
              _generateCube(),
              const Text('data', style: TextStyle(fontSize: 18, color: Colors.white))
            ],
          ),
        ]
      ),
    );
  }

  _generateCube(){
    return GestureDetector(
      onTap: (){print("aqui gesto xd");},
      child: Row(
        children: <Widget>[
          _columOfFace(false),
          const SizedBox(width: 3),
          _columOfFace(true),
          const SizedBox(width: 3),
          _columOfFace(false),
          const SizedBox(width: 3),
          _columOfFace(false),
        ],
      ),
    );
  }

  _columOfFace(bool isMiddleRow){
    return Column(
      children: <Widget>[
        (isMiddleRow) ? _unitOfFace(Colors.blue) : const SizedBox(width: 20, height: 20,),
        const SizedBox(height: 3,),
        _unitOfFace(Colors.blue),
        const SizedBox(height: 3,),
        (isMiddleRow) ? _unitOfFace(Colors.blue) : const SizedBox(width: 20, height: 20,),
      ],
    );
  }

  _unitOfFace(Color color){
    return Container(color: color, width: 20, height: 20);
  }
}