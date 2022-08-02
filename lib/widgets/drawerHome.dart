import 'package:cube_timer/widgets/drawer_header.dart';
import 'package:flutter/material.dart';


class DrawerHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //width: width*(1/1.5),
      backgroundColor: Colors.white,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          SafeArea(
            top: false,
            bottom: false,
            child: Container(
              color:Colors.amber,
              child: HomeDrawerHeader()
            ),
          ),
          ListTile(
            title: const Text('Cronómetro'),
            leading: Icon(Icons.timer_outlined),
            onTap: (){},
          ),
          ListTile(
            title: const Text('Entrenamiento'),
            leading: Icon(Icons.control_camera_outlined),
            onTap: (){},
          ),
          ListTile(
            title: const Text('Algoritmos'),
            leading: Icon(Icons.library_books_outlined),
            onTap: (){},
          ),
          const Divider(color: Colors.grey),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 10.0),
            child: Text('Otros')
          ),
          ListTile(
            title: const Text('Importar/Exportar'),
            leading: Icon(Icons.folder_outlined),
            onTap: (){},
          ),
          ListTile(
            title: const Text('Tema de la Aplicación'),
            leading: Icon(Icons.palette_outlined),
            onTap: (){},
          ),
          ListTile(
            title: const Text('Esquema de colores'),
            leading: Icon(Icons.format_paint_outlined),
            onTap: (){},
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('Ajustes'),
            leading: Icon(Icons.settings_outlined),
            onTap: (){},
          ),
          ListTile(
            title: const Text('Donar'),
            leading: Icon(Icons.favorite_outline),
            onTap: (){},
          ),
          ListTile(
            title: const Text('Acerca de y comentarios'),
            leading: Icon(Icons.help_outline),
            onTap: (){},
          ),
        ],
      ),
    );
  }

}