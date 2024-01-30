import 'package:flutter/material.dart';

import 'package:cube_timer/models/menu_items.dart';
import 'package:expandable/expandable.dart'; 

class DrawerHomeTwo extends StatefulWidget {
  const DrawerHomeTwo({super.key});

  @override
  State<DrawerHomeTwo> createState() => _DrawerHomeTwoState();
}

class _DrawerHomeTwoState extends State<DrawerHomeTwo> {
  int navDrawerIndex = 1;
  Image headerDrawer = Image.asset('assets/icons/menu_header.png');
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value){
          setState(() {
            navDrawerIndex = value;
          });
        },
        children: [
          _drawerImage(),
          NavigationDrawerDestination(
            icon: Icon(appMenuItems.elementAt(0).icon, color:Colors.black87),
            label: Text(
              appMenuItems.elementAt(0).title,
              style: _styleText(),
            ),
          ),
          //expandable options
          ExpandablePanel(
            header: _listItem(
              Icons.timer_outlined, 
              'asd crrano'),
            collapsed: Container(),
            expanded: Column(
              children:<Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text("asd"),
                )
                // NavigationDrawerDestination(
                //   icon: const Icon(Icons.abc_outlined, color:Colors.black87),
                //   label: Text(
                //     appMenuItems.elementAt(0).title,
                //     style: _styleText(),
                //   ),
                // ),
              ]
            ),
          ),


          //separador
          const Divider(color: Colors.grey),
          const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 8.0, bottom: 15.0),
              child: Text('Otros', style: TextStyle(fontFamily: 'Arial', color: Colors.black87))
          ),
          
          ...appMenuItems
          .sublist(1,6)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon, color:Colors.black87),
            label: Text(
              item.title,
              style: _styleText(),
            ),
          )),

        ],
      )
    );
  }

  _drawerImage() => SafeArea(
    left: false,
    child: SizedBox(
      height: 178,
      child: headerDrawer,
    ),
  );

  _styleText() => const TextStyle(
    fontFamily: 'Arial',
    color: Colors.black87,
    fontSize: 15.0);

  _listItem(IconData icon, String name) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          //color: Colors.yellow,
          padding: const EdgeInsets.only(left: 5.0),
          width: 50,
          height: 45,
          child: Icon(icon, size: 26.0,color: Colors.black54)
        ),
        Container(
          padding: const EdgeInsets.only(left: 21.0),
          child:  Text(name, style: const TextStyle(
                    fontFamily: 'Arial',
                    color: Colors.black87, 
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
                  )
        )
      ],
    );
  }
}

