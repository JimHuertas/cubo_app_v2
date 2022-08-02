import 'package:flutter/material.dart';


class AppBarHome extends StatelessWidget with PreferredSizeWidget{
  final double widthDevice;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Color colorTheme;

  AppBarHome({
    required this.colorTheme,
    this.widthDevice = 0,
    required this.scaffoldKey
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          color: colorTheme,
          child: AppBar(
            title: Container(
              width: double.infinity,
              color: Colors.amber,
              child: const Text('3x3')
            ),
            
            actions: [
              Container(
                color: Colors.red,
                width: 30.0,
                child: IconButton(
                  icon: const Icon(Icons.hourglass_empty_outlined), 
                  onPressed: (){},),
              ),
              Container(
                //color: Colors.green,
                width: 35.0,
                child: IconButton(
                  icon: const Icon(Icons.category_outlined), 
                  onPressed: (){},),
              ),
            ],
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            backgroundColor: const Color.fromARGB(67, 76, 76, 76),
            leadingWidth: 40.0,
            leading: IconButton(
                icon: const Icon(Icons.settings_outlined,color: Colors.white, 
                size: 23.0,), 
                onPressed: () => scaffoldKey.currentState!.openDrawer(),
              ),
            ),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+5.0);
}
