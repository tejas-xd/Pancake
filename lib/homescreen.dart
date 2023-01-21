import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pancake/more/morescreenbody.dart';
import 'package:pancake/search/searchscreenbody.dart';
import 'package:pancake/shared/customvalues.dart';
import 'home/homescreenbody.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({
    Key? key,
  }) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: xcanvas,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: PageView(
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              currentIndex = page;
            });
          },
          children: const <Widget>[
            Homescreenbody(),
            Searchscreenbody(),
            Morescreenbody(),
          ],
        ),
        bottomNavigationBar: Align(
          alignment: FractionalOffset.bottomCenter,
          child: SizedBox(
            height: 100,
            child: CurvedNavigationBar(
              key: _bottomNavigationKey,
              height: 60.0,
              index: currentIndex,
              items: <Widget>[
                Icon(
                  Icons.home,
                  size: 30,
                  color: xbicon,
                ),
                Icon(
                  Icons.search,
                  size: 30,
                  color: xbicon,
                ),
                Icon(
                  Icons.menu,
                  size: 30,
                  color: xbicon,
                ),
              ],
              color: xbnavbar,
              buttonBackgroundColor: xbnavbar,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              onTap: (index) {
                currentIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
                setState(() {});
              },
              letIndexChange: (index) => true,
            ),
          ),
        ),
      ),
    );
  }
}

// Align(
// alignment: FractionalOffset.bottomCenter,
// child:  Container(
// height: 50,
// padding: const EdgeInsets.symmetric(horizontal: 8),
// margin: const EdgeInsets.fromLTRB(8, 8, 8, 16),
// decoration: BoxDecoration(
// color: Colors.white.withOpacity(0.9),
// borderRadius: BorderRadius.circular(12)),
// child: GNav(
// gap: 8,
// color: Colors.redAccent,
// activeColor: Colors.redAccent,
// tabBackgroundColor: Colors.black,
// iconSize: 24,
// padding:
// const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
// duration: const Duration(milliseconds: 400),
// tabs: const [
// GButton(
// icon: Icons.home,
// text: 'Home',
// ),
// GButton(
// icon: Icons.search,
// text: 'Search',
// ),
// GButton(
// icon: Icons.account_circle,
// text: 'Profile',
// ),
// ],
// selectedIndex: currentIndex,
// onTabChange: (value) {
// currentIndex = value;
// _pageController.animateToPage(
// value,
// duration: const Duration(milliseconds: 200),
// curve: Curves.linear,
// );
// setState(() {});
// },
// )),
// )
