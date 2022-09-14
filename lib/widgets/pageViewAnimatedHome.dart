import 'package:flutter/material.dart';

import '../pages/home.dart';
import 'package:provider/provider.dart';
import '../providers/views_provider.dart';


class PageViewAnimated extends StatefulWidget {
  
  List<Widget> views;
  PageController pageController;
  

  PageViewAnimated({
    required this.views,
    required this.pageController,
  });
  
  @override
  State<PageViewAnimated> createState() => _PageViewAnimatedState();
}

class _PageViewAnimatedState extends State<PageViewAnimated> {

  @override
  Widget build(BuildContext context) {

    return PageView(
      physics: const ClampingScrollPhysics(),
      controller: widget.pageController,
      onPageChanged: (index) {
        context.read<ViewsModel>().changePage(index);
      },
      padEnds: false,
      children: widget.views,
    );
  }
}