import 'package:flutter/material.dart';
import 'package:pancake/more/morescreenbody.dart';
import 'package:pancake/search/searchscreenbody.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:pancake/shared/customwidgets.dart';
import 'home/homescreenview.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var Screens = [
    const Homescreenbody(),
    const Searchscreenbody(),
    const Morescreenbody()
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: oppositecolor),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              Backgroupimage(imageback: selectedbackimg),
              Screens[widget.index],
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            height: 60.0,
            index: widget.index,
            items: <Widget>[
              Icon(
                Icons.home,
                size: 30,
                color: uppermodecolor,
              ),
              Icon(
                Icons.search,
                size: 30,
                color: uppermodecolor,
              ),
              Icon(
                Icons.menu,
                size: 30,
                color: uppermodecolor,
              ),
            ],
            color: Colors.white10,
            buttonBackgroundColor: Colors.white10,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) => setState(() => widget.index = index),
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
