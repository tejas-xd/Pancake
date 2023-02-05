import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pancake/data_handling/apiservices.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:pancake/shared/customwidgets.dart';
import 'package:pancake/shared/watch_movie.dart';
import 'package:readmore/readmore.dart';

import '../data_handling/models/user.dart';
import '../homescreen.dart';

class MovieDescription extends StatefulWidget {
  final int id;

  const MovieDescription({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: FutureBuilder(
            future: ApiService().getMovieDetail(widget.id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                Future<Users?> readUser() async {
                  final docuser = FirebaseFirestore.instance
                      .collection('Users')
                      .doc(FirebaseAuth.instance.currentUser!.uid);
                  final snapshot = await docuser.get();
                  if (snapshot.exists) {
                    return Users.fromJson(snapshot.data()!);
                  }
                }

                Future<bool> isfavorite() async {
                  Users? test = await readUser();
                  int a = 0;
                  for (int i = 0; i < test!.favorite!.length; i++) {
                    if (test.favorite![i].id == widget.id) {
                      a = 1;
                    }
                  }
                  if (a == 0) {
                    return false;
                  }
                  return true;
                }

                Future<bool> iswatchlist() async {
                  Users? test = await readUser();
                  int a = 0;
                  for (int i = 0; i < test!.watchlist!.length; i++) {
                    if (test.watchlist![i].id == widget.id) {
                      a = 1;
                    }
                  }
                  if (a == 0) {
                    return false;
                  }
                  return true;
                }

                var size = MediaQuery.of(context).size;
                String title = (snapshot.data.releaseDate == '')
                    ? '   N/A  '
                    : '   ${snapshot.data.releaseDate.toString().substring(0, 4)}  ';
                String adult =
                    (snapshot.data.adult == true) ? '  18+  ' : '  PG  ';
                String runtime = (snapshot.data.runtime == null)
                    ? '  N/A  '
                    : '  ${snapshot.data.runtime}min';
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
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: const BoxDecoration(
                        color: Color(0xff242124),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                      ),
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
                                '$rating/10',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                          FutureBuilder(
                            future: isfavorite(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (snapshot.data == true) {
                                        FirebaseFirestore.instance
                                            .collection("Users")
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .update({
                                          'favorite': FieldValue.arrayRemove([
                                            {
                                              'id': widget.id,
                                              'type': 'movie',
                                              'image': image
                                            }
                                          ]),
                                        });
                                      } else {
                                        FirebaseFirestore.instance
                                            .collection("Users")
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .update({
                                          'favorite': FieldValue.arrayUnion([
                                            {
                                              'id': widget.id,
                                              'type': 'movie',
                                              'image': image
                                            }
                                          ]),
                                        });
                                      }
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      (snapshot.data == true)
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.redAccent,
                                              size: 25.0,
                                            )
                                          : const Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.redAccent,
                                              size: 25.0,
                                            ),
                                      const Text(
                                        ' favorite ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          FutureBuilder(
                            future: iswatchlist(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (snapshot.data == true) {
                                        FirebaseFirestore.instance
                                            .collection("Users")
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .update({
                                          'watchlist': FieldValue.arrayRemove([
                                            {
                                              'id': widget.id,
                                              'type': 'movie',
                                              'image': image
                                            }
                                          ]),
                                        });
                                      } else {
                                        FirebaseFirestore.instance
                                            .collection("Users")
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .update({
                                          'watchlist': FieldValue.arrayUnion([
                                            {
                                              'id': widget.id,
                                              'type': 'movie',
                                              'image': image
                                            }
                                          ]),
                                        });
                                      }
                                    });
                                  },
                                  child: (snapshot.data)?Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.greenAccent,
                                        size: 25.0,
                                      ),
                                      Text(
                                        ' remove ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                  ):Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.white,
                                        size: 25.0,
                                      ),
                                      Text(
                                        ' watchlist ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  ]),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15),
                      child: Text(
                        snapshot.data.title,
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
                    title + adult + runtime,
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
                  InkWell(
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
                      height: 50,
                      margin: EdgeInsets.only(
                          top: 15,
                          left: size.width * 0.3,
                          right: size.width * 0.3,
                          bottom: 15),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.teal)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.play_circle,
                            color: Colors.white,
                            size: 22,
                          ),
                          Text(
                            "PLAY",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2),
                          )
                        ],
                      ),
                    ),
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
                  Movielist(
                      futre: ApiService()
                          .getMovieRecommendations(widget.id.toString()))
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
