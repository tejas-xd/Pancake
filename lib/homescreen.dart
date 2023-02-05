import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: PageView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: const <Widget>[
          Homescreenbody(),
          Searchscreenbody(),
        ],
      ),
      bottomNavigationBar: Align(
        alignment: FractionalOffset.bottomCenter,
        child:  Container(
            height: 60,
            width: MediaQuery.of(context).size.width*0.8,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.fromLTRB(8, 8, 8, 16),
            decoration: BoxDecoration(
                color: xbnavbar,
                borderRadius: BorderRadius.circular(12)),
            child: GNav(
              gap: 8,
              color: Colors.tealAccent,
              activeColor: Colors.tealAccent,
              tabBackgroundColor: Colors.white.withOpacity(0.2),
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