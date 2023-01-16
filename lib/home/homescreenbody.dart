import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'package:pancake/shared/customgridview.dart';
import 'package:pancake/shared/customwidgets.dart';
import 'package:pancake/shared/customgridview.dart';

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
    final PageController _inpageController = PageController(initialPage: 0);
    int incurrentIndex = 0;

    return Scaffold(
      appBar: PreferredSize(
          child: Column(
            children: [
              Container(
                height: size.height * 0.05,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                child: Image.asset('assets/appbar.png'),
              ),
              Container(
                  height: size.height * 0.055,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12)),
                  child: GNav(
                    gap: 8,
                    color: Colors.redAccent,
                    activeColor: Colors.redAccent,
                    tabBackgroundColor: Colors.black,
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
                        icon: Icons.movie_creation_outlined,
                        text: 'Movie',
                      ),
                      GButton(
                        icon: Icons.tv_outlined,
                        text: 'TV-Show',
                      ),
                    ],
                    selectedIndex: incurrentIndex,
                    onTabChange: (value) {
                      incurrentIndex = value;
                      _inpageController.animateToPage(
                        value,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                      setState(() {});
                    },
                  )),
            ],
          ),
          preferredSize: Size(size.width, size.height * 0.14)),
      body: PageView(
        controller: _inpageController,
        onPageChanged: (page) {
          setState(() {
            incurrentIndex = page;
          });
        },
        children: <Widget>[
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
      padding: EdgeInsets.only(bottom: 60),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        HorizontalSlider(),
        CustomBar(
          str1: 'Trending',
          str2: 'Movies',
          navigate: GridViewDatamovie(
            futre: ApiService().getTrendingMovie(),
          ),
        ),
        Movielist(
          futre: ApiService().getTrendingMovie(),
        ),
        CustomBar(
          str1: 'Trending',
          str2: 'TV-shows',
          navigate: GridViewDatatv(
            futre: ApiService().getTrendingTVshow(),
          ),
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
        padding: EdgeInsets.only(bottom: 60),
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: [
      CustomBar(
          str1: 'Popular',
          str2: 'Movies',
          navigate:
          GridViewDatamovie(futre: ApiService().getPopularMovie())),
      Movielist(futre: ApiService().getPopularMovie()),
      CustomBar(
          str1: 'Top Rated',
          str2: 'Movies',
          navigate:
          GridViewDatamovie(futre: ApiService().getTopRatedMovie())),
      Movielist(futre: ApiService().getTopRatedMovie()),
      CustomBar(
          str1: 'Upcoming',
          str2: 'Movies',
          navigate:
          GridViewDatamovie(futre: ApiService().getUpcomingMovie())),
      Movielist(futre: ApiService().getUpcomingMovie()),
      CustomBar(
          str1: 'Now Playing',
          str2: 'Movies',
          navigate:
          GridViewDatamovie(futre: ApiService().getNowPlayingMovie())),
      Movielist(futre: ApiService().getNowPlayingMovie()),
    ]
    );
  }
}

class TVtab extends StatelessWidget {
  const TVtab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(bottom: 60),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          CustomBar(
            str1: 'Popular',
            str2: 'TV-Show',
            navigate: GridViewDatatv(
              futre: ApiService().getPopularTVshow(),
            ),
          ),
          TVlist(
            futre: ApiService().getPopularTVshow(),
          ),
          CustomBar(
            str1: 'Top Rated',
            str2: 'TV-Show',
            navigate: GridViewDatatv(
              futre: ApiService().getTopRatedTVshow(),
            ),
          ),
          TVlist(futre: ApiService().getTopRatedTVshow(),),
          CustomBar(
            str1: 'Upcoming',
            str2: 'TV-Show',
            navigate: GridViewDatatv(
              futre: ApiService().getUpcomingTVshow(),
            ),
          ),
          TVlist(futre: ApiService().getUpcomingTVshow(),),
          CustomBar(
            str1: 'Now Playing',
            str2: 'TV-Show',
            navigate: GridViewDatatv(
              futre: ApiService().getNowPlayingTVshow(),
            ),
          ),
          TVlist(futre: ApiService().getNowPlayingTVshow(),),
        ],
    );
  }
}






