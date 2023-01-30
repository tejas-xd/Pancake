import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pancake/data_handling/apiservices.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:pancake/shared/customwidgets.dart';
import '../data_handling/models/user.dart';
import '../homescreen.dart';

class TVDescription extends StatefulWidget {
  final int id;

  TVDescription({Key? key, required this.id,}) : super(key: key);
  String select = '';
  late int i = -1;
  @override
  State<TVDescription> createState() => _TVDescriptionState();
}

class _TVDescriptionState extends State<TVDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: FutureBuilder(
            future: ApiService().getTVDetail(widget.id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var size = MediaQuery.of(context).size;
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

                int x = (widget.i == -1)
                    ? snapshot.data.seasons[0].seasonNumber
                    : widget.i;
                (widget.id == -1)
                    ? widget.select = snapshot.data.seasons[0].seasonNumber
                    : {};
                (widget.select == '')
                    ? widget.select = snapshot.data.seasons[0].name
                    : {};
                void showBookmarkDialogbox(BuildContext context) => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
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
                                          widget.select =
                                              snapshot.data.seasons[index].name;
                                          widget.i = snapshot
                                              .data.seasons[index].seasonNumber;
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Text(
                                          snapshot.data.seasons[index].name,
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
                        color: Colors.blueGrey,
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
                                                'type': 'tv',
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
                                                'type': 'tv',
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
                                                'type': 'tv',
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
                                                'type': 'tv',
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
                    child: Text(
                      snapshot.data.overview,
                      style: TextStyle(
                          fontSize: 16,
                          color: mode,
                          fontWeight: FontWeight.w400),
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
                                Text(' ${widget.select} ',
                                    style: const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2)),
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
