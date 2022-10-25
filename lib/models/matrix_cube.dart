import 'matrix.dart';
import 'package:flutter/material.dart';


/*

List of matrix that represent face cubes 
0th position :
[r,r]
[r,r]

0th position :
[r,r]
[r,r]

*/


class MatrixCube{
  Type n = Type.cube2x2; //cube type
  List<Matrix> original_cube = [];
  List<Matrix> cube = [];
  
  MatrixCube(Type i){
    n = i;
  }

  
  void move_f(){
    int? nType = nCubeType[n];
    //rotar la matriz principal del movimiento
    int swapnum = 0;
    for (int i = 0; i < nType!; i++) {
      for (int j = 0; j < nType; j++) {
        
      }
    }
    //rotar colores de la derecha

    //rotar colores de la izquierda

    //rotar colores de arriba

    //rotar colores de abajo
  }
  

} 