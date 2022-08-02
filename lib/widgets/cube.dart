import 'package:cube_timer/models/scramble.dart';
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';


class Cube extends StatefulWidget {
  double deviceSize;
  BuildContext context;
  Scramble scramble;

  Cube({
    required this.deviceSize,
    required this.context,
    required this.scramble
  });

  @override
  State<Cube> createState() => _CubeState();
}

class _CubeState extends State<Cube> {
  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _oneFace(widget.deviceSize),
      GestureDetector(
        onTap: () {
          setState(() {
            widget.scramble.generarScramble(3);
          });
          print(widget.scramble.combinacion);
        },
        child: Text(widget.scramble.combinacion, style: const TextStyle(color: Colors.white, fontSize: 25.0)))
    ]
  );
  }
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