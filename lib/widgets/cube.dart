import 'package:cube_timer/models/scramble.dart';
import 'package:flutter/material.dart';



Widget cube(BuildContext context, Scramble scramble){
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;
  final double deviceSize = 100;//(width < height) ? width : height;  
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _oneFace(deviceSize),
      Text(scramble.combinacion, style: const TextStyle(color: Colors.white, fontSize: 25.0))
    ]
  );
}

Row _row3Faces(double deviceSize) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(height: deviceSize, width: deviceSize, color: Colors.red,),
        _oneFace(deviceSize),
        Container(height: deviceSize, width: deviceSize, color: Colors.red,),
      ],
    );
}

Container _oneFace(double deviceSize) {
  return Container(
    width: deviceSize,
    height: deviceSize,
    color: Colors.amber,
    child: Column(
      children: <Widget>[
        _row3Cube(deviceSize, Colors.blueGrey),
        SizedBox(height: deviceSize*(1/50)),
        _row3Cube(deviceSize, Colors.greenAccent),
        SizedBox(height: deviceSize*(1/50)),
        _row3Cube(deviceSize, Colors.white)
      ],
    ),
  );
}

Row _row3Cube(double deviceSize, Color color) {
  return Row(
    children: <Widget>[
      _oneCubito(deviceSize, color),
      SizedBox(width: deviceSize*(1/50)),
      _oneCubito(deviceSize, color),
      SizedBox(width: deviceSize*(1/50)),
      _oneCubito(deviceSize, color)
    ],
  );
}

Container _oneCubito(double deviceSize, Color color) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(3.0)
    ),
    width: deviceSize*(32/100),
    height: deviceSize*(32/100),
  );
}