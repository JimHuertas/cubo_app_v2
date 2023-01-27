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

  Matrix(Type type_cube, int element){
    type= type_cube;
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