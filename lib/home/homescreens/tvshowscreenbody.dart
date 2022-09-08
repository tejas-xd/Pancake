import 'package:flutter/material.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'package:pancake/shared/customwidgets.dart';
import 'package:pancake/shared/customgridview.dart';

class Tvscreenbody extends StatefulWidget {
  const Tvscreenbody({Key? key}) : super(key: key);

  @override
  State<Tvscreenbody> createState() => _TvscreenbodyState();
}

class _TvscreenbodyState extends State<Tvscreenbody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Namebar(
          namebar: 'Popular Tv shows',
          navigate: GridViewDatatv(
            futre: ApiService().getPopularTVshow(),
          ),
        ),
        ListViewDatatv(
          futre: ApiService().getPopularTVshow(),
        ),
        Namebar(
          namebar: 'Top Rated Tv shows',
          navigate: GridViewDatatv(
            futre: ApiService().getTopRatedTVshow(),
          ),
        ),
        ListViewDatatv(
          futre: ApiService().getTopRatedTVshow(),
        ),
        Namebar(
          namebar: 'Upcoming Tv shows',
          navigate: GridViewDatatv(
            futre: ApiService().getUpcomingTVshow(),
          ),
        ),
        ListViewDatatv(
          futre: ApiService().getUpcomingTVshow(),
        ),
        Namebar(
          namebar: 'Now Playing Tv shows',
          navigate: GridViewDatatv(
            futre: ApiService().getNowPlayingTVshow(),
          ),
        ),
        ListViewDatatv(
          futre: ApiService().getNowPlayingTVshow(),
        ),
      ],
    );
  }
}
