import 'package:flutter/material.dart';

class DrawerDirt extends StatefulWidget {

  final int? selectedIndex;
  final void Function(int)? onDestinationSelected;
  final List<Widget> children;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;

  DrawerDirt({
    this.selectedIndex,
    this.onDestinationSelected,
    required this.children,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor
  });
  
  @override
  State<DrawerDirt> createState() => _DrawerDirtState();
}

class _DrawerDirtState extends State<DrawerDirt> {

  @override
  Widget build(BuildContext context) {
    // final int totalNumberOfDestinations =
    //     widget.children.whereType<NavigationDrawerDestination>().toList().length;

    return Container();
  }
}