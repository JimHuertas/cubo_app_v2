import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    this.subtitle = "none",
    required this.link,
    required this.icon
  });
}

//extras icons
final Image iconOll = Image.asset('assets/icons/oll_black.png',color: Colors.black54, fit: BoxFit.cover,width: 20,height: 20,);
final Image iconPll = Image.asset('assets/icons/pll_black.png',color: Colors.black54, fit: BoxFit.cover,width: 20,height: 20,);

///SideMenuBar include every iconm, title and link to the page
const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Cronómetro', 
    link: "/timer", 
    icon: Icons.timer_outlined
  ),

  //Training options
  // MenuItem(
  //   title: 'OLL', 
  //   link: "/oll_training", 
  //   icon: ImageIcon(AssetImage('assets/icons/oll_black.png'),
  // ),
  // MenuItem(
  //   title: 'PLL', 
  //   link: "/oll_training", 
  //   icon: 
  // ),

  //Algorithms Option
  // MenuItem(
  //   title: 'OLL', 
  //   link: "/oll_algorithms", 
  //   icon: Icons.control_camera_outlined,
  // ),
  // MenuItem(
  //   title: 'PLL', 
  //   link: "/pll_algorithms", 
  //   icon: Icons.control_camera_outlined,
  // ),
  
  MenuItem(
    title: 'Exportar/Importar', 
    link: "/", 
    icon: Icons.control_camera_outlined,
  ),

  MenuItem(
    title: 'Tema de la Aplicación', 
    link: "/", 
    icon: Icons.folder_outlined,
  ),

  MenuItem(
    title: 'Esquema de Colores', 
    link: "/", 
    icon: Icons.format_paint_outlined,
  ),

  MenuItem(
    title: 'Ajustes', 
    link: "/settings", 
    icon: Icons.settings_outlined,
  ),

  MenuItem(
    title: 'Donar', 
    link: "/", 
    icon: Icons.favorite_outline,
  ),

  MenuItem(
    title: 'Acerca de y comentarios', 
    link: "/about", 
    icon: Icons.help_outline,
  ),
];



