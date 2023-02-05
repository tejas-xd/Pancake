import 'package:flutter/material.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:pancake/shared/customwidgets.dart';


class Homescreenbody extends StatefulWidget {
  const Homescreenbody({Key? key}) : super(key: key);

  @override
  State<Homescreenbody> createState() => _HomescreenbodyState();
}

class _HomescreenbodyState extends State<Homescreenbody>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                height: size.height * 0.04,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                child: Image.asset('assets/appbar.png'),
              ),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.6,
                color: Colors.transparent,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: EdgeInsets.zero,
                  indicatorColor: xtindicator,
                  controller: tabController,
                  labelStyle: TextStyle(
                    color: xtlabel,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Home',
                    ),
                    Tab(
                      text: 'Movies',
                    ),
                    Tab(
                      text: 'Shows',
                    ),
                  ],
                ),
              ),
            ],
          )),
      body: TabBarView(
        controller: tabController,
        children: const <Widget>[
          Hometab(),
          Movietab(),
          TVtab(),
        ],
      ),
    );
  }
}

class Hometab extends StatelessWidget {
  const Hometab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 60, top: 15),
      shrinkWrap: true,
      physics:
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: Axis.vertical,
      children: [
        const HorizontalSlider(),
        const CustomBar(
          str1: 'Trending',
          str2: 'Movies',
        ),
        Movielist(
          futre: ApiService().getTrendingMovie(),
        ),
        const CustomBar(
          str1: 'Trending',
          str2: 'TV-shows',
        ),
        TVlist(
          futre: ApiService().getTrendingTVshow(),
        ),
      ],
    );
  }
}

class Movietab extends StatelessWidget {
  const Movietab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.only(bottom: 60),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        children: [
          const CustomBar(
            str1: 'Popular',
            str2: 'Movies',
          ),
          Movielist(futre: ApiService().getPopularMovie()),
          const CustomBar(
            str1: 'Top Rated',
            str2: 'Movies',
          ),
          Movielist(futre: ApiService().getTopRatedMovie()),
          const CustomBar(
            str1: 'Upcoming',
            str2: 'Movies',
          ),
          Movielist(futre: ApiService().getUpcomingMovie()),
          const CustomBar(
            str1: 'Now Playing',
            str2: 'Movies',
          ),
          Movielist(futre: ApiService().getNowPlayingMovie()),
        ]);
  }
}

class TVtab extends StatelessWidget {
  const TVtab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 60),
      shrinkWrap: true,
      physics:
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: Axis.vertical,
      children: [
        const CustomBar(
          str1: 'Popular',
          str2: 'TV-Show',
        ),
        TVlist(
          futre: ApiService().getPopularTVshow(),
        ),
        const CustomBar(
          str1: 'Top Rated',
          str2: 'TV-Show',
        ),
        TVlist(
          futre: ApiService().getTopRatedTVshow(),
        ),
        const CustomBar(
          str1: 'Upcoming',
          str2: 'TV-Show',
        ),
        TVlist(
          futre: ApiService().getUpcomingTVshow(),
        ),
        const CustomBar(
          str1: 'Now Playing',
          str2: 'TV-Show',
        ),
        TVlist(
          futre: ApiService().getNowPlayingTVshow(),
        ),
      ],
    );
  }
}