import 'package:cube_timer/widgets/cube.dart';
import 'package:cube_timer/models/scramble.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); //To Open Drawer with Appbar
  final Scramble scramble = Scramble();
  final Color colorTheme = Colors.black;
  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colorTheme,
      appBar: _appBarHome(width, height),
      body: Center(
        child: cube()//Text(scramble.combinacion, style: TextStyle(color: Colors.white),),
      ),
      bottomNavigationBar: _rectangleBottonNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: ((){ 
          setState(() {scramble.generarScramble(3);});
        }),
      ),
      drawer: Drawer(
        //width: width*(1/1.5),
        backgroundColor: Colors.white,
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }

  Container _rectangleBottonNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(                                           
          topRight: Radius.circular(20), 
          topLeft: Radius.circular(20)
        ),
      ),
      child: ClipRRect(        
        borderRadius: const BorderRadius.only(                                           
          topLeft: Radius.circular(20.0),                                            
          topRight: Radius.circular(20.0),                                           
        ),
        child: _navigationBarTimer()
      )
    );
  }

  PreferredSize _appBarHome(double _width, double _height) {
    return PreferredSize(
      preferredSize: Size(_width, 67.0),
      child: SafeArea(
        bottom: true,
        child: Container(
          height: 500.0,
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          color: Colors.black,
          child: AppBar(
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            backgroundColor: const Color.fromARGB(67, 76, 76, 76),
            leading: IconButton(
              icon: const Icon(Icons.settings_outlined,color: Colors.white, 
              size: 25.0,), 
              onPressed: () => _scaffoldKey.currentState!.openDrawer(),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _navigationBarTimer() {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(67, 76, 76, 76),
      iconSize: 25.0,
      unselectedItemColor: Colors.white70,
      selectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.timer_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timeline_sharp),
          label: '',
        ),
      ],
    );
  }
}