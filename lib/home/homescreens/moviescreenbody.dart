import 'package:flutter/material.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'package:pancake/shared/customwidgets.dart';
import 'package:pancake/shared/customgridview.dart';

class Moviescreenboy extends StatefulWidget {
  const Moviescreenboy({Key? key}) : super(key: key);

  @override
  State<Moviescreenboy> createState() => _MoviescreenboyState();
}

class _MoviescreenboyState extends State<Moviescreenboy> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Namebar(
            namebar: 'Popular Movies',
            navigate: GridViewDatamovie(futre: ApiService().getPopularMovie())),
        ListViewDatamovie(futre: ApiService().getPopularMovie()),
        Namebar(
            namebar: 'Top Rated Movies',
            navigate:
                GridViewDatamovie(futre: ApiService().getTopRatedMovie())),
        ListViewDatamovie(futre: ApiService().getTopRatedMovie()),
        Namebar(
            namebar: 'Upcoming Movies',
            navigate:
                GridViewDatamovie(futre: ApiService().getUpcomingMovie())),
        ListViewDatamovie(futre: ApiService().getUpcomingMovie()),
        Namebar(
            namebar: 'Now Playing Movies',
            navigate:
                GridViewDatamovie(futre: ApiService().getNowPlayingMovie())),
        ListViewDatamovie(futre: ApiService().getNowPlayingMovie()),
      ],
    );
  }
}
