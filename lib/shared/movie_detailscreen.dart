import 'package:flutter/material.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:pancake/shared/watch%20movie.dart';

class MovieDescription extends StatelessWidget {
  final int id;

  MovieDescription({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(canvasColor: oppositecolor),
        home: Scaffold(
          body: FutureBuilder(
            future: ApiService().getMovieDetail(id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children:[
                    Column(children: [
                    ClipRRect(
                      // borderRadius:
                      //
                      //     const BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                      child: (snapshot.data.backdropPath == null)
                          ? Container(
                              height: 300,
                              width: 1000,
                              color: uppermodecolor,
                            )
                          : Container(
                              height: 300,
                              width: 1000,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/original/${snapshot.data.backdropPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 30),
                        child: Text(
                          snapshot.data.title,
                          style: TextStyle(
                              fontSize: 24,
                              color: uppermodecolor,
                              fontWeight: FontWeight.w300),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 26,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 9),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.blueGrey,
                          ),
                          child: Text(
                            (snapshot.data.releaseDate == '')
                                ? 'N/A'
                                : snapshot.data.releaseDate
                                    .toString()
                                    .substring(0, 4),
                            style:
                                TextStyle(fontSize: 14, color: uppermodecolor),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '|',
                          style: TextStyle(fontSize: 30, color: uppermodecolor),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 25,
                            ),
                            Text(
                              snapshot.data.voteAverage.toString(),
                              style: TextStyle(
                                  fontSize: 16, color: uppermodecolor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '|',
                          style: TextStyle(fontSize: 30, color: uppermodecolor),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${snapshot.data.runtime} min',
                          style: TextStyle(fontSize: 16, color: uppermodecolor),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        snapshot.data.overview,
                        style: TextStyle(
                            fontSize: 18,
                            color: uppermodecolor,
                            fontWeight: FontWeight.w200),
                      ),
                    ),

                  ]),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewExample(
                                  id: snapshot.data.id.toString(),
                                )),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.redAccent,
                          ),
                          child: Center(
                            child: Text(
                              'WATCH NOW',
                              style:
                              TextStyle(fontSize: 15, color: uppermodecolor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ]
                );
              } else {
                return Container();
              }
            },
          ),
        ));
  }
}
