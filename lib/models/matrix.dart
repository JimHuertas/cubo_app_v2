import 'dart:ffi';

enum Type{
    cube2x2,
    cube3x3,
    cube4x4,
    cube5x5
}

class Matrix {
  List<List<dynamic>> _matrix = List.generate(1, (i) => []);
  
  Matrix(Type i, dynamic element){
    switch (i) {
      case Type.cube2x2:
        _matrix = List.generate(2, (i) => []);
        for(var i=0; i<2; i++){
          List<dynamic> list = List.generate(2, (index) => element);
          _matrix[i] = list;
        }
        break;
      case Type.cube3x3:
        _matrix = List.generate(3, (i) => []);
        for(var i=0; i<3; i++){
          List<dynamic> list = List.filled(3, element);
          _matrix[i] = list;
        }
        break;

      case Type.cube4x4:
        _matrix = List.generate(4, (i) => []);
        for(var i=0; i<4; i++){
          List<dynamic> list = List.filled(4, element);
          _matrix[i] = list;
        }
        break;

      case Type.cube5x5:
        _matrix = List.generate(5, (i) => []);
        for(var i=0; i<5; i++){
          List<dynamic> list = List.filled(5, element);
          _matrix[i] = list;
        }
        break;
    }
  }
  
  void printMatrix(){
    String aux = "";
    for(var i=0; i<_matrix.length; i++){
      for(var j=0; j<_matrix[i].length; j++){
        aux += _matrix[i][j] + " ";
      }
      print(aux);
      aux = "";
    }
  }
 

}