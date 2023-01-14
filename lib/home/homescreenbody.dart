import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'package:pancake/shared/customgridview.dart';
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: PreferredSize(
      //     preferredSize: Size(size.width, size.height * 0.11),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //           padding: EdgeInsets.only(bottom: 10),
      //           height: size.height*0.06,
      //           child: Image.asset('assets/appbar.png'),
      //         ),
      //         TabBar(
      //           controller: tabController,
      //           tabs: [
      //             Padding(
      //                 padding: const EdgeInsets.symmetric(vertical: 5),
      //                 child: Text(
      //                   'Home',
      //                   style: TextStyle(
      //                       fontSize: 20,
      //                       color: uppermodecolor,
      //                       fontWeight: FontWeight.w400),
      //                 )),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(vertical: 5),
      //               child: Text(
      //                 'Movies',
      //                 style: TextStyle(
      //                     fontSize: 20,
      //                     color: uppermodecolor,
      //                     fontWeight: FontWeight.w400),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(vertical: 5),
      //               child: Text(
      //                 'TvShows',
      //                 style: TextStyle(
      //                     fontSize: 20,
      //                     color: uppermodecolor,
      //                     fontWeight: FontWeight.w400),
      //               ),
      //             ),
      //           ],
      //         )
      //       ],
      //     )),
      body: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          CustomSlider(ApiService().getTrendingAll()),
          CustomBar(
            str1: 'Trending',
            str2: 'Movies',
            navigate: GridViewDatamovie(
              futre: ApiService().getTrendingMovie(),
            ),
          ),
          ListViewDatamovie(
            futre: ApiService().getTrendingMovie(),
          ),
          CustomBar(
            str1: 'Trending',
            str2: 'TV-shows',
            navigate: GridViewDatatv(
              futre: ApiService().getTrendingTVshow(),
            ),
          ),
          ListViewDatatv(
            futre: ApiService().getTrendingTVshow(),
          ),
          CustomBar(
              str1: 'Popular',
              str2: 'Movies',
              navigate: GridViewDatamovie(futre: ApiService().getPopularMovie())),
          ListViewDatamovie(futre: ApiService().getPopularMovie()),
          CustomBar(
              str1: 'Top Rated',
              str2: 'Movies',
              navigate:
              GridViewDatamovie(futre: ApiService().getTopRatedMovie())),
          ListViewDatamovie(futre: ApiService().getTopRatedMovie()),
          CustomBar(
              str1: 'Upcoming',
              str2: 'Movies',
              navigate:
              GridViewDatamovie(futre: ApiService().getUpcomingMovie())),
          ListViewDatamovie(futre: ApiService().getUpcomingMovie()),
          CustomBar(
              str1: 'Now Playing',
              str2: 'Movies',
              navigate:
              GridViewDatamovie(futre: ApiService().getNowPlayingMovie())),
          ListViewDatamovie(futre: ApiService().getNowPlayingMovie()),
        ],
      ),
    );
  }
}
