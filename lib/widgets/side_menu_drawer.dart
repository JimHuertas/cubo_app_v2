import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';

class DrawerHome extends StatefulWidget {
  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  Image iconOll = Image.asset('assets/icons/oll_black.png',color: Colors.black54, fit: BoxFit.cover,width: 20,height: 20,);
  Image iconPll = Image.asset('assets/icons/pll_black.png',color: Colors.black54, fit: BoxFit.cover,width: 20,height: 20,);
  Image headerDrawer = Image.asset('assets/icons/menu_header.png');
  Color colorTheme = Colors.black54;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        //width: width*(1/1.5),
        backgroundColor: Colors.white,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          //padding: EdgeInsets.,
          children: <Widget>[
            SafeArea(
              left: false,
              child: SizedBox(
                height: 178,
                child: headerDrawer,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              child: _listTileDrawer(
                Icons.timer_outlined,
                'Cronómetro',
                true
              ),
            ),
            
            _expandible(
              Icons.control_camera_outlined,
              'Entrenamiento'
            ),
            _expandible(
              Icons.library_books_outlined,
              'Algoritmos'
            ),
            const Divider(color: Colors.grey),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 8.0, bottom: 15.0),
              child: Text('Otros', style: TextStyle(fontFamily: 'Arial', color: Colors.black87))
            ),
            _listTileDrawer(
              Icons.folder_outlined, 
              'Exportar/Importar',
              false,
            ),
            _listTileDrawer(
              Icons.palette_outlined, 
              'Tema de la Aplicación',
              false
            ),
            _listTileDrawer(
              Icons.format_paint_outlined, 
              'Esquema de colores',
              false
            ),
            const Divider(color: Colors.grey),
            _listTileDrawer(
              Icons.settings_outlined, 
              'Ajustes',
              false
            ),
            _listTileDrawer(
              Icons.favorite_outline, 
              'Donar',
              false
            ),
            _listTileDrawer(
              Icons.help_outline, 
              'Acerca de y comentarios',
              false
            ),
            const SizedBox(height: 25)
          ],
        ),
      ),
    );
  }

  _listTileDrawer(IconData icon, String title, bool selected) {
    return ListTile(
      
      selected: selected,
      selectedColor: Colors.blue, 
      title: Text(
        title, 
        style: TextStyle(
          fontFamily: 'Arial',
          color: (isActive) ? Colors.blue : Colors.black87,
          fontSize: 15.0)
        ),
      leading: Icon(icon, color: Colors.black54),
      dense: true,
      visualDensity: const VisualDensity(horizontal: -4),
      //visualDensity: const VisualDensity(vertical: -2),
      onTap: (){
},
    );
  }

  _expandible(IconData iconTitle, String title){
    return ExpandablePanel(
      header: _listItem(iconTitle, title),
      collapsed: Container(), //Text('\$crim', softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
      expanded: Column(
        children:  <Widget>[
          _listItemExpandible('OLL', iconOll),
          _listItemExpandible('PLL', iconPll)
        ]
      ),
    );
  }

  _listItemExpandible(String title, Image icon) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 33.0),
      title: Text(
        title,
        style: const TextStyle(
        fontFamily: 'Arial',
        color: Colors.black54, 
        fontSize: 15.0)
      ),
      leading: icon,
      visualDensity: const VisualDensity(vertical: -2),
      onTap: (){},
    );
  }

  _listItem(dynamic icon, String name) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          //color: Colors.yellow,
          padding:  (icon is IconData) 
                    ? const EdgeInsets.only(left: 5.0)
                    : const EdgeInsets.only(left: 31.0, bottom: 12.0),
          width: 50,
          height: (icon is IconData) 
                  ? 45
                  : 42,
          child: (icon is IconData) 
          ? Icon(icon, size: 26.0,color: Colors.black54)
          : icon,
        ),
        Container(
          padding:  (icon is IconData) 
                    ? const EdgeInsets.only(left: 21.0)
                    : const EdgeInsets.only(left: 35.0),
          child:  (icon is IconData) 
                  ? Text(name, style: const TextStyle(
                    fontFamily: 'Arial',
                    color: Colors.black87, 
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
                    )
                  : Text(name),
        )
      ],
    );
  }
}