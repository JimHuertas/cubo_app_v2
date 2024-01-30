import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:cube_timer/widgets/alertDialogNewCategory.dart';
import '../providers/views_provider.dart';
import 'package:cube_timer/providers/category_cube_provider.dart';


class AppBarHome extends StatefulWidget implements PreferredSizeWidget{
  final double widthDevice;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Color colorTheme;
  // final Type typeCube;
  AppBarHome({
    required this.colorTheme,
    this.widthDevice = 0,
    required this.scaffoldKey,
    //required this.typeCube
  });

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+5.0);
}

class _AppBarHomeState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100,
        alignment: AlignmentDirectional.centerEnd,
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: AppBar(
          title: GestureDetector(
            onTap: () async =>showAlertDialogNewCategory(context),
            child: _tittleCategory(),
          ),   
          actions: [
            (context.watch<ViewsModel>().selectedIndex != 0)
            ? SizedBox(
              width: 40.0,
              child: IconButton(
                iconSize: 22.0,
                icon: const Icon(Icons.hourglass_empty_outlined), 
                onPressed: (){},),
            )
            : const SizedBox(width: 40),
            SizedBox(
              width: 35.0,
              child: IconButton(
                iconSize: 24.0,
                icon: const Icon(Icons.category_outlined), 
                onPressed: (() => print ("momento god")),//() async =>showAlertDialogNewCategory(context),),
              )
            ),
            const SizedBox(width: 12)
          ],
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(17.0))
          ),
          backgroundColor: const Color.fromARGB(67, 76, 76, 76),
          leadingWidth: 40.0,
          leading: Container(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: const Icon(Icons.settings_outlined,color: Colors.white, 
              size: 23.0,), 
              onPressed: () => widget.scaffoldKey.currentState!.openDrawer(),
            ),
          ),
        ),
      ),
    );
  }

  _tittleCategory() {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left:20),
        margin: const EdgeInsets.only(left: 50, right: 20),
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(context.watch<CategoryCubeModel>().category!, style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )),
                Text(context.watch<CategoryCubeModel>().mode!, style: const TextStyle(
                  fontSize: 13.0,
                ))
              
              ],
            ),
            const SizedBox(width: 5),
            const Icon(Icons.arrow_drop_down)
          ],
        )
      ),
    );
  }
}
