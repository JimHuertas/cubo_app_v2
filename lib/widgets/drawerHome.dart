import 'package:flutter/material.dart';


class DrawerHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}