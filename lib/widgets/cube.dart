import 'package:flutter/material.dart';



Widget cube(){
  const double width = 100;
  const double height = 100;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _row3Faces(width, height)
    ]
  );
}

Row _row3Faces(double _height, double _width) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(height: _height, width: _width, color: Colors.red,),
        _oneFace(_width, _height),
        Container(height: _height, width: _width, color: Colors.red,),
      ],
    );
}

Container _oneFace(double _width, double _height) {
  return Container(
  width: _width,
  height: _height,
  color: Colors.amber,
  child: Column(
    children: <Widget>[
      const SizedBox(height: 4),
      _row3Cube(_width, _height, Colors.blueGrey),
      const SizedBox(height: 5),
      _row3Cube(_width, _height, Colors.greenAccent),
      const SizedBox(height: 5),
      _row3Cube(_width, _height, Colors.white)
    ],
  ),
);
}

Row _row3Cube(double width, double height, Color color) {
  return Row(
        children: <Widget>[
          const SizedBox(width: 4),
          _oneCubito(width, height, color),
          const SizedBox(width: 5),
          _oneCubito(width, height, color),
          const SizedBox(width: 5),
          _oneCubito(width, height, color)
        ],
      );
}

Container _oneCubito(double width, double height, Color color) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(3.0)
    ),
    width: width*(1/4),
    height: height*(1/4),
  );
}