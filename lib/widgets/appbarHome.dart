import 'package:flutter/material.dart';


class AppBarHome extends StatelessWidget with PreferredSizeWidget{
  final double widthDevice;
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppBarHome({
    this.widthDevice = 0,
    required this.scaffoldKey
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(widthDevice, 75.0),
      child: SafeArea(
        bottom: true,
        child: Container(
          height: 500.0,
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          color: Colors.black,
          child: AppBar(
            title: Container(
              width: double.infinity,
              color: Colors.amber,
              child: const Text('3x3')
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.lightbulb_outlined), 
                onPressed: (){},),
              const SizedBox(width: 0),
              IconButton(
                icon: const Icon(Icons.category_outlined),
                onPressed: (){},),
            ],
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            backgroundColor: const Color.fromARGB(67, 76, 76, 76),
            leading: IconButton(
              icon: const Icon(Icons.settings_outlined,color: Colors.white, 
              size: 25.0,), 
              onPressed: () => scaffoldKey.currentState!.openDrawer(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
