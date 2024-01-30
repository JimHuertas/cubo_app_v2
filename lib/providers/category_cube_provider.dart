import 'package:flutter/material.dart';

import 'package:cube_timer/models/matrix.dart';
import 'package:cube_timer/models/matrix_cube.dart';
import 'package:cube_timer/models/scramble.dart';


class CategoryCubeModel with ChangeNotifier{
  Scramble scr = Scramble();
  MatrixCube cube = MatrixCube(Type.cube3x3);
  MatrixCube? originalCube;
  String scramble = "No existe";
  String? category;
  String? mode;

  CategoryCubeModel(){
    originalCube = MatrixCube(Type.cube3x3);
    category = "Cubo 3x3";
    mode = "normal";
    scr.generarScramble(3);
    cube.scramble(scr.comb2);
    scramble = scr.combinacion;
  }

  changeCategory(int tipo){
    if(tipo >= 2 && tipo <= 7){
      if(tipo != nCubeType[tipo]){
        cube = MatrixCube(intToType[tipo]!);
        //aqui cambio del scramble al tamaño del cubo.
        category = "Cubo ${tipo}x$tipo";
      }
    }
    notifyListeners();
  }

  changeScramble(int tipo) {
    cube = MatrixCube(Type.cube3x3);
    scr.generarScramble(tipo);
    scramble = scr.combinacion;
    cube.scramble(scr.comb2);
    notifyListeners();
  }

  changeMode(String newMode){
    mode = newMode;
    notifyListeners();
  }

  

}