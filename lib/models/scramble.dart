import 'dart:math';

// import 'package:flutter/material.dart';

Random random = Random();

class Scramble{
  String combinacion;
  List<String> comb2;
  int tipo;
  int tam;

  Scramble({
    this.combinacion = "No existe",
    this.comb2 = const ['empty'],
    this.tipo = 0,
    this.tam = 0
  });

  int combinar(){
    tam = random.nextInt(7)+14;
    return tam;
  }

  generarScramble(int tipo){
    tam = random.nextInt(7)+14;
    comb2 = List<String>.filled(tam,'null',growable: true);
    combinacion = "";
    for (var i=0; i < tam; i++) {
      String mov = _generarOneMovement3X3();
      if(tipo == 3){
        // String before = mov;
        combinacion += "$mov ";
        comb2[i] = mov;
      }
    }
    // only for test
    combinacion = "U2 L' F2 L2 D2 B2 D L2 B2 U F2 D B U L2 U' L' D F";
    comb2.clear();
    comb2.add("2U");
    comb2.add("L'");
    comb2.add("2F");
    // comb2.add("2L");
    // comb2.add("2D");
    // comb2.add("2B");
    // comb2.add("D");
    // comb2.add("2L");
    // comb2.add("2B");
    // comb2.add("U");
    // comb2.add("2F");
    // comb2.add("D");
    // comb2.add("B");
    // comb2.add("U");
    // comb2.add("2L");
    // comb2.add("U'");
    // comb2.add("L'");
    // comb2.add("D");
    // comb2.add("F");
  }

  String _generarOneMovement3X3(){
    String mov = "";
    int movement = random.nextInt(6)+1;
    int prime = random.nextInt(2);
    int twoTimes = random.nextInt(2);
    
    if(twoTimes == 1){
        mov += "2"; 
    }

    if(movement == 1){mov += "R";}
    else if(movement == 2){mov += "L";}
    else if(movement == 3){mov += "U";}
    else if(movement == 4){mov += "D";}
    else if(movement == 5){mov += "F";}
    else{mov += "B";}

    if(prime == 1 && twoTimes == 0){
      mov += "'";
    }
    
    return mov;
  }
  
}