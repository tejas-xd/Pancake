import 'package:flutter/material.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:pancake/shared/customwidgets.dart';
import 'package:readmore/readmore.dart';
import '../homescreen.dart';

class TVDescription extends StatefulWidget {
  final int id;

  const TVDescription({Key? key, required this.id,}) : super(key: key);
  @override
  State<TVDescription> createState() => _TVDescriptionState();
}

class _TVDescriptionState extends State<TVDescription> {

  String select = '';
  int i = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiService().getTVDetail(widget.id.toString()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var size = MediaQuery.of(context).size;
          if (snapshot.hasData) {
            int x = (i == -1) ? snapshot.data.seasons[0].seasonNumber : i;
            (select == '') ? select = snapshot.data.seasons[0].name : {};

            void showBookmarkDialogbox(BuildContext context) => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff242124),
                          borderRadius: BorderRadius.circular(20)),
                      height: size.height * 0.4,
                      width: size.width * 0.4,
                      child: ListView.builder(
                          itemCount: snapshot.data.seasons.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Container(
                                width: size.width * 0.6,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius:
                                    BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: Colors.tealAccent)),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      select =
                                          snapshot.data.seasons[index].name;
                                      i = snapshot
                                          .data.seasons[index].seasonNumber;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                      snapshot.data.seasons[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.tealAccent,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 2)),
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                });

            String title = (snapshot.data.firstAirDate == '')
                ? '   N/A  '
                : '   ${snapshot.data.firstAirDate.toString().substring(0, 4)}  ';
            String adult =
            (snapshot.data.adult == true) ? '  18+  ' : '  PG  ';
            String rating =
            (snapshot.data.voteAverage.toString().length < 3)
                ? snapshot.data.voteAverage.toString()
                : snapshot.data.voteAverage.toString().substring(0, 3);
            String image = snapshot.data.posterPath;
            return ListView(padding: EdgeInsets.zero, children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50.0)),
                  child: (snapshot.data.backdropPath == null)
                      ? Container(
                    height: size.height * 0.4,
                    width: double.infinity,
                    color: mode,
                  )
                      : SizedBox(
                    height: size.height * 0.4,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50)),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/${snapshot.data.backdropPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * 0.36,
                      left: size.width * 0.2,
                      bottom: 30),
                  decoration: const BoxDecoration(
                    color: Color(0xff242124),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 25.0,
                            ),
                            Text(
                              ' $rating / 10',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data.status,
                              style: const TextStyle(
                                color: Colors.teal,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const Text(
                              ' Status ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ]),
              Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0, horizontal: 15),
                  child: Text(
                    snapshot.data.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 5),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                title + adult,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('   OVERVIEW   ',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2)),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: 4),
                child: ReadMoreText(
                  snapshot.data.overview,
                  style: TextStyle(
                      fontSize: 16,
                      color: mode,
                      fontWeight: FontWeight.w400),
                  trimLines: 4,
                  colorClickableText: Colors.lightBlue,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Show less',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('   EPISODES   ',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2)),
                  Container(
                      margin: const EdgeInsets.only(
                          left: 15, top: 8, bottom: 8, right: 15),
                      child: TextButton(
                        onPressed: () => showBookmarkDialogbox(context),
                        child: Row(
                          children: [
                            Container(
                              width: size.width*0.4,
                              child: Text(' $select ',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2)),
                            ),
                            const Icon(Icons.expand_circle_down_outlined,
                                size: 18, color: Colors.blueGrey)
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: size.width,
                height: 150,
                child: Seasonlist(
                    season: x.toString(), id: widget.id.toString()),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      left: 15, top: 8, bottom: 8, right: 2),
                  child: Text(
                    'Recommendation'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2),
                  )),
              TVlist(
                  futre: ApiService()
                      .getTVRecommendations(widget.id.toString()))
            ]);
          } else {
            return Container();
          }
        },
      ),
    );

  }

  @override
  void dispose() {
    Navigator.push(context,MaterialPageRoute(
        builder: (context) => const Homescreen()));
    super.dispose();
  }
}