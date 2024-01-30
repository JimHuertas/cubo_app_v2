enum Type{
    cube2x2,
    cube3x3,
    cube4x4,
    cube5x5,
    cube6x6,
    cube7x7
}

Map<Type, int> nCubeType = {
  Type.cube2x2:2,
  Type.cube3x3:3,
  Type.cube4x4:4,
  Type.cube5x5:5,
  Type.cube6x6:6,
  Type.cube7x7:7
};

class Matrix {
  List<List<int>> _matrix = List.generate(1, (i) => []);
  Type? type;
  int? length;

  Matrix(Type typeCube, int element){
    type= typeCube;
    _matrix = List.generate(nCubeType[type]!, (index) => []);
    for(var i=0; i<nCubeType[type]!; i++){
      List<int> list = List.generate(nCubeType[type]!, (index) => element);
      _matrix[i] = list;
    }
    length = _matrix.length;
  }

  void printMatrix(){
    String aux = "";
    for(var i=0; i<_matrix.length; i++){
      for(var j=0; j<_matrix[i].length; j++){
        aux += _matrix[i][j].toString();
        // aux += "($i$j) ";
        aux += " ";
      }
      print(aux);
      aux = "";
    }
  }
 
  List<List<dynamic>> get matrix => _matrix;
  void setElement(int i, int j, int color){
    _matrix[i][j] = color;
  }

  dynamic operator[](int i){
    return _matrix[i];
  }

  // late dynamic operator=(Matrix i){
  //   return _matrix = i._matrix;
  // };

  void rotarMatrizHorario(){
    int N = _matrix.length;//initial i
    int swapAux = 0;
    for(int i=1,k=0;i<N+1;i++,k++){
      for(int j=N-i; j>-1; j--){
        swapAux = _matrix[j][N-i];
        _matrix[j][N-i] = _matrix[k][j];
        _matrix[k][j] = swapAux;
      }
    }
    print("");
    for(int i=1;i<(N/2.0).round()+1;i++){
        for(int j=i;j<N-i;j++){
          swapAux = _matrix[j][i-1];
          _matrix[j][i-1] = _matrix[N-i][j];
          _matrix[N-i][j] = swapAux;
        }
    }
  }

  void rotarMatrizAntihorario(){
    int swapAux = 0;
    int N = _matrix.length;
    for(int i=0;i<N;i++){
      for(int j=i;j<N;j++){
        swapAux = _matrix[i][j];
        _matrix[i][j] = _matrix[N-j-1][i];
        _matrix[N-j-1][i] = swapAux;
      }
    }
    for(int i=1;i<(N/2.0).round()+1;i++){
      for(int j=i;j<N-i;j++){
        swapAux = _matrix[N-i][j];
        _matrix[N-i][j] = _matrix[N-j-1][N-i];
        _matrix[N-j-1][N-i] = swapAux;
      }
    }
  }
}


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

  void changeNum(int pos, int i, int j, int nuevo){cube[pos][i][j] = nuevo;}
  int numPos(int pos, int i, int j) => cube[pos][i][j];

  void scramble(List<String> scr){
    for (String i in scr) {
      switch (i) {
        case "R":
          moveR();
          break;
        case "R'":
          moveRPrime();
          break;
        case "2R":
          moveR();
          moveR();
          break;
        case "L":
          moveL();
          break;
        case "L'":
          moveLPrime();
          break;
        case "2L":
          moveL();
          moveL();
          break;
        case "U":
          moveU();
          break;
        case "U'":
          moveUPrime();
          break;
        case "2U":
          moveU();
          moveU();
          break;
        case "D":
          moveD();
          break;
        case "D'":
          moveDPrime();
          break;
        case "2D":
          moveD();
          moveD();
          break;
        case "F":
          moveF();
          break;
        case "F'":
          moveFPrime();
          break;
        case "2F":
          moveF();
          moveF();
          break;
        case "B":
          moveB();
          break;
        case "B'":
          moveBPrime();
          break;
        case "2B":
          moveB();
          moveB();
          break;
        default:
          print("no hay este caso $i");
          break;
      }
    }
    printCube();
  }
  void cleanScramble(){
    cube = originalCube;
  }

  void printCube(){
    cube[0].printMatrix();
    print("");
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
        // str1 += "($i$j)";

        aux = cube[2];
        str2 += aux[i][j].toString();
        // str2 += "($i$j)";

        aux = cube[3];
        str3 += aux[i][j].toString();
        // str3 += "($i$j)";

        aux = cube[4];
        str4 += aux[i][j].toString();
        // str4 += "($i$j)";

        aux = cube[1];
        str1 += " ";
        str2 += " ";
        str3 += " ";
        str4 += " ";
      }
      result = "$str1 $str2 $str3 $str4";
      print(result);
      str1 = "";
      str2 = "";
      str3 = "";
      str4 = "";
    }
    print("");
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
    cube[0][nType!-1][i] = cube[3][i][0];
    cube[3][i][0] = cube[5][0][i];
    cube[5][0][i] = cube[1][i][nType!-1];
    cube[1][i][nType!-1] = auxSwap[i];
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
    for (int i = 0; i < (nType!/2).floor(); i++) {
      int aux = cube[0][i][0];
      cube[0][i][0] = cube[0][nType!-i-1][0]; 
      cube[0][nType!-i-1][0] = aux;

      cube[4][i][nType!] = cube[0][nType!-i-1][0]; 
      cube[0][i][0] = cube[0][nType!-i-1][0]; 
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


void main(List<String> args) {
  MatrixCube cube = MatrixCube(Type.cube3x3);
  // cube.moveLPrime();
  // cube.moveUPrime();
  int cont = 1;
  
  for (var k = 0; k < 6; k++) {
    for (var i = 0; i < cube.nType!; i++) {
      for (var j = 0; j < cube.nType!; j++) {
        cube.changeNum(k, i, j, cont);
        cont++;
      }
    }
  }
  cube.moveL();
  cube.printCube();
  // while(true){
  //   String? s = stdin.readLineSync();
  //   if (s != null){
  //     int n = int.parse(s);
  //     if(n == 0){
  //       cube.moveF();
  //       print("");
  //       cube.printCube;
  //     }else{
  //       break;
  //     }
  //   } else{
  //     break;
  //   }
  // }

}