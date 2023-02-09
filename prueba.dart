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
      result = "$str1 \t $str2 \t $str3 \t $str4";
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


void main(List<String> args) {
  MatrixCube cube = MatrixCube(Type.cube3x3);
  // cube.moveLPrime();
  cube.moveUPrime();
  cube.printCube();


}