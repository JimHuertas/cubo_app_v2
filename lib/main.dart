import 'package:flutter/material.dart';

import 'pages/home.dart';

void main(){
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      debugShowCheckedModeBanner: false,
      title: 'Cube Timer',
      initialRoute: 'home',
      home: HomePage(),
      routes: {
        'home': (_) => HomePage(),
      },
    );
  }
}