import 'matrix.dart';
/*
List of matrix that represent face cubes 
  - 0th (Up)
  - 1st (Left)
  - 2nd (Front)
  - 3TH (Right)
  - 4th (Back)
  - 5th (Down)

EXAMPLE 2X2 CUBE:  
      [0,0]
      [0,0]
[1,1] [2,2] [3,3] [4,4]
[1,1] [2,2] [3,3] [4,4]
      [5,5]
      [5,5]

*/
class MatrixCube{
  Type n = Type.cube2x2; //cube type
  List<Matrix> originalCube = [];
  List<Matrix> cube = [];
  int? nType;
  
  MatrixCube(Type i){
    n = i;
    nType = nCubeType[n];
    for(int k=0; k<6; k++){
      Matrix newFace = Matrix(n, k);
      cube.add(newFace);
    }
  }

  void printCube(){
    cube[0].printMatrix();
    Matrix aux = cube[1];
    int? nType = nCubeType[n];
    String str1="";
    String str2="";
    String str3="";
    String str4="";
    for (var i=0; i<nType!; i++) {
      String result = "";
      for (var j=0; j<nType; j++) {
        str1 += aux[i][j].toString();

        aux = cube[2];
        str2 += aux[i][j].toString();

        aux = cube[3];
        str3 += aux[i][j].toString();

        aux = cube[4];
        str4 += aux[i][j].toString();

        aux = cube[1];
        str1 += " ";
        str2 += " ";
        str3 += " ";
        str4 += " ";
      }
      result = str1 + "\t" + str2 + "\t" + str3 + "\t" + str4;
      print(result);
      str1 = "";
      str2 = "";
      str3 = "";
      str4 = "";
    }
    cube[5].printMatrix();
  }


//MOVE B
  void moveB(){
    //rotar la matriz principal del movimiento
    cube[4].rotarMatrizHorario();

    List<int> auxSwap = [];
    for (var i = 0; i < nType!; i++) {
      auxSwap.add(cube[0][0][i]);
      cube[0][0][i] = cube[3][i][nType!-1];
      cube[3][i][nType!-1] = cube[5][nType!-1][i];
      cube[5][nType!-1][i] = cube[1][i][0];
      cube[1][i][0] = auxSwap[i];
    }
  }
  void moveBPrime(){
    //rotar la matriz principal del movimiento
    cube[4].rotarMatrizAntihorario();

    List<int> auxSwap = [];
    for (var i = 0; i < nType!; i++) {
      auxSwap.add(cube[0][0][i]);
      cube[0][0][i] = cube[1][i][0];
      cube[1][i][0] = cube[5][nType!-1][i];
      cube[5][nType!-1][i] = cube[3][i][nType!-1];
      cube[3][i][nType!-1] = auxSwap[i];
    }
  }

//MOVE U
void moveU(){
  //rotar la matriz principal del movimiento
  cube[0].rotarMatrizHorario();

  List<int> auxSwap = [];
  for (var i = 0; i < nType!; i++) {
    auxSwap.add(cube[2][0][i]);
    cube[2][0][i] = cube[3][0][i];
    cube[3][0][i] = cube[4][0][i];
    cube[4][0][i] = cube[1][0][i];
    cube[1][0][i] = auxSwap[i];
  }
}
void moveUPrime(){
  //rotar la matriz principal del movimiento
  cube[0].rotarMatrizAntihorario();

  List<int> auxSwap = [];
  for (var i = 0; i < nType!; i++) {
    auxSwap.add(cube[2][0][i]);
    cube[2][0][i] = cube[1][0][i];
    cube[1][0][i] = cube[4][0][i];
    cube[4][0][i] = cube[3][0][i];
    cube[3][0][i] = auxSwap[i];
  }
}

//MOVE R
void moveR(){
  //rotar la matriz principal del movimiento
  cube[3].rotarMatrizHorario();

  List<int> auxSwap = [];
  for (var i = 0; i < nType!; i++) {
    auxSwap.add(cube[0][i][nType!-1]);
    cube[0][i][nType!-1] = cube[2][i][nType!-1];
    cube[2][i][nType!-1] = cube[5][i][nType!-1];
    cube[5][i][nType!-1] = cube[4][i][0];
    cube[4][i][0] = auxSwap[i];
  }
}
void moveRPrime(){
  //rotar la matriz principal del movimiento
  cube[3].rotarMatrizAntihorario();

  List<int> auxSwap = [];
  for (var i = 0; i < nType!; i++) {
    auxSwap.add(cube[0][i][nType!-1]);
    cube[0][i][nType!-1] = cube[4][i][0];
    cube[4][i][0] = cube[5][i][nType!-1];
    cube[5][i][nType!-1] = cube[2][i][nType!-1];
    cube[2][i][nType!-1] = auxSwap[i];
  }
}


//MOVE D
void moveD(){
  //rotar la matriz principal del movimiento
  cube[5].rotarMatrizHorario();

  List<int> auxSwap = [];
  for (var i = 0; i < nType!; i++) {
    auxSwap.add(cube[2][nType!-1][i]);
    cube[2][nType!-1][i] = cube[1][nType!-1][i];
    cube[1][nType!-1][i] = cube[4][nType!-1][i];
    cube[4][nType!-1][i] = cube[3][nType!-1][i];
    cube[3][nType!-1][i] = auxSwap[i];
  }
}
void moveDPrime(){
  //rotar la matriz principal del movimiento
  cube[5].rotarMatrizAntihorario();

  List<int> auxSwap = [];
  for (var i = 0; i < nType!; i++) {
    auxSwap.add(cube[2][nType!-1][i]);
    cube[2][nType!-1][i] = cube[3][nType!-1][i];
    cube[3][nType!-1][i] = cube[4][nType!-1][i];
    cube[4][nType!-1][i] = cube[1][nType!-1][i];
    cube[1][nType!-1][i] = auxSwap[i];
  }
}

//MOVE F
void moveF(){
  //rotar la matriz principal del movimiento
  cube[2].rotarMatrizHorario();

  List<int> auxSwap = [];
  for (var i = 0; i < nType!; i++) {
    auxSwap.add(cube[0][nType!-1][i]);
    cube[0][nType!-1][i] = cube[1][i][nType!-1];
    cube[1][i][nType!-1] = cube[5][0][i];
    cube[5][0][i] = cube[3][i][0];
    cube[3][i][0] = auxSwap[i];
  }
}
void moveFPrime(){
  //rotar la matriz principal del movimiento
  cube[2].rotarMatrizAntihorario();

  List<int> auxSwap = [];
  for (var i = 0; i < nType!; i++) {
    auxSwap.add(cube[0][nType!-1][i]);
    cube[0][nType!-1][i] = cube[1][i][nType!-1];
    cube[1][i][nType!-1] = cube[5][0][i];
    cube[5][0][i] = cube[3][i][0];
    cube[3][i][0] = auxSwap[i];
  }
}

//MOVE L
  void moveL(){
    //rotacion cara principal
    cube[1].rotarMatrizHorario();

    List<int> auxSwap = [];
    for (var i = 0; i < nType!; i++) {
      auxSwap.add(cube[0][i][0]);
      cube[0][i][0] = cube[4][i][nType!-1];
      cube[4][i][nType!-1] = cube[5][i][0];
      cube[5][i][0] = cube[2][i][0];
      cube[2][i][0] = auxSwap[i];
    }
  }
  void moveLPrime(){
    //rotacion cara principal
    cube[1].rotarMatrizAntihorario();

    List<int> auxSwap = [];
    for (var i = 0; i < nType!; i++) {
      auxSwap.add(cube[0][i][0]);
      cube[0][i][0] = cube[2][i][0];
      cube[2][i][0] = cube[5][i][0];
      cube[5][i][0] = cube[4][i][nType!-1];
      cube[4][i][nType!-1] = auxSwap[i];
    }
  }
} 