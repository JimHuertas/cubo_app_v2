import 'package:cube_timer/models/scramble.dart';
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
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.scramble.generarScramble(3);
              });
            },
            child: Text(widget.scramble.combinacion, style: const TextStyle(color: Colors.white, fontSize: 25.0))
          ),
          _cube(widget.deviceSize),
        ]
      ),
    );
  }



  _oneCubeFace(Color color){
    return Container(
      width: widget.deviceSize,
      height: widget.deviceSize,
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          _rawThreeLilCubes(color, false),
          SizedBox(height: widget.deviceSize*(1/50)),
          _rawThreeLilCubes(color, true),
          SizedBox(height: widget.deviceSize*(1/50)),
          _rawThreeLilCubes(color, false),
        ],
      ),
    );
  }

  _rawThreeLilCubes(Color color, bool isMiddleRow){
    return Row(
      children: <Widget>[
        (isMiddleRow) ? _oneLilCube(color) : Container(),
        SizedBox(width: widget.deviceSize*(1/50)),
        _oneLilCube(color),
        SizedBox(width: widget.deviceSize*(1/50)),
        (isMiddleRow) ? _oneLilCube(color) : Container(),
      ],
    );
  }

  _oneLilCube(Color color){
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3.0)
      ),
      width: widget.deviceSize*(32/100),
      height: widget.deviceSize*(32/100),
    );
  }


}

Column _cube(double deviceSize){
  return Column(
      children: <Widget>[
        _row3Faces(deviceSize,Colors.red),
        const SizedBox(height: 2),
        _row3Faces(deviceSize, Colors.red),
        const SizedBox(height: 2),
        _row3Faces(deviceSize, Colors.red),
      ],
  );

}
Row _row3Faces(double deviceSize, Color color, ) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _oneFace(deviceSize, color),
        const SizedBox(width: 2),
        _oneFace(deviceSize, color),
        const SizedBox(width: 2),
        _oneFace(deviceSize, color),
      ],
    );
}

Container _oneFace(double deviceSize, Color color) {
  return Container(
    width: deviceSize,
    height: deviceSize,
    color: Colors.transparent,
    child: Column(
      children: <Widget>[
        _row3Cube(deviceSize, color),
        SizedBox(height: deviceSize*(1/50)),
        _row3Cube(deviceSize, color),
        SizedBox(height: deviceSize*(1/50)),
        _row3Cube(deviceSize, color)
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