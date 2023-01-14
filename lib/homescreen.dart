import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pancake/more/morescreenbody.dart';
import 'package:pancake/search/searchscreenbody.dart';
import 'home/homescreenview.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homescreen extends StatefulWidget {
  Homescreen({
    Key? key,
  }) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final PageController _pageController = PageController(initialPage: 0);
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
        canvasColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
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
            child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(12)),
                child: GNav(
                  gap: 8,
                  color: Colors.black,
                  activeColor: Colors.black,
                  tabBackgroundColor: Colors.redAccent,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  duration: const Duration(milliseconds: 400),
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: Icons.account_circle,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: currentIndex,
                  onTabChange: (value) {
                    currentIndex = value;
                    _pageController.animateToPage(
                      value,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear,
                    );
                    setState(() {});
                  },
                )),
          ),
        ),
      ),
    );
  }
}
