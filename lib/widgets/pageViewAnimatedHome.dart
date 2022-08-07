import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../pages/home.dart';


class PageViewAnimated extends StatefulWidget {
  
  List<Widget> views;
  int selectedIndex;
  PageController pageController;

  PageViewAnimated({
    required this.views,
    required this.pageController,
    required this.selectedIndex
  });
  
  @override
  State<PageViewAnimated> createState() => _PageViewAnimatedState();
}

class _PageViewAnimatedState extends State<PageViewAnimated> {
  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      Provider.of<ViewsModel>(context, listen: false).selectedIndex = widget.selectedIndex;
    });
  }

  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const ClampingScrollPhysics(),
      controller: widget.pageController,
      onPageChanged: (index) {
        widget.selectedIndex = index;
      },
      padEnds: false,
      children: widget.views,
    );
  }
}