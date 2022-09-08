import 'package:flutter/material.dart';
import 'package:pancake/home/homescreens/moviescreenbody.dart';
import 'package:pancake/home/homescreens/tvshowscreenbody.dart';
import 'package:pancake/home/homescreens/homescreenbody.dart';
import 'package:pancake/shared/customvalues.dart';

class Homescreenbody extends StatefulWidget {
  const Homescreenbody({Key? key}) : super(key: key);

  @override
  State<Homescreenbody> createState() => _HomescreenbodyState();
}

class _HomescreenbodyState extends State<Homescreenbody>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 45,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Image.asset('assets/appbar.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        TabBar(
          controller: tabController,
          tabs: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 20,
                      color: uppermodecolor,
                      fontWeight: FontWeight.w400),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Movies',
                style: TextStyle(
                    fontSize: 20,
                    color: uppermodecolor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'TvShows',
                style: TextStyle(
                    fontSize: 20,
                    color: uppermodecolor,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 630,
          child: TabBarView(
            controller: tabController,
            children: [
              HomeScreenbody(),
              const Moviescreenboy(),
              const Tvscreenbody()
            ],
          ),
        ),
      ],
    );
  }
}
