import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pancake/data_handling/apiservices.dart';
import 'package:pancake/shared/movie_detailscreen.dart';
import 'package:pancake/shared/tvshow_detailscreen.dart';
import 'package:pancake/shared/watch_tv.dart';
import 'customgridview.dart';


double dot = 0;
class HorizontalSlider extends StatefulWidget {
  const HorizontalSlider({Key? key}) : super(key: key);

  @override
  State<HorizontalSlider> createState() => _HorizontalSliderState();
}
class _HorizontalSliderState extends State<HorizontalSlider> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService().getTrendingAll(),
        builder: (context, AsyncSnapshot snapshot) {
          var size = MediaQuery.of(context).size;
          if (snapshot.hasData) {
            return CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int itemIndex,
                  int pageViewIndex) =>
                  GestureDetector(
                    onTap: () {
                      if (snapshot.data[itemIndex].mediaType == 'movie') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDescription(
                                id: snapshot.data[itemIndex].id,
                              )),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TVDescription(
                                id: snapshot.data[itemIndex].id,
                              )),
                        );
                      }
                    },
                    child: SizedBox(
                      width: size.width,
                      height: size.width/6,
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(20.0)),
                        child: Image(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            'https://image.tmdb.org/t/p/original/${snapshot.data[itemIndex].backdropPath}',
                          ),
                        ),
                      ),
                    ),
                  ),
              options: CarouselOptions(
                aspectRatio: 10 / 6,
                autoPlay: true,
                viewportFraction: 1,
              ),
            );
          } else {
            return CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int itemIndex,
                  int pageViewIndex) =>
                  Container(
                    width: 270,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
              options: CarouselOptions(
                aspectRatio: 9 / 9,
                autoPlay: true,
                viewportFraction: 0.9,
              ),
            );
          }
        });
  }
}

class CustomBar extends StatelessWidget {
  const CustomBar({
    Key? key,
    required this.str1,
    required this.str2,
  }) : super(key: key);

  final String str1;
  final String str2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              str1.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 5),
            ),
          ),
          Text(
            str2.toUpperCase(),
            style: const TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 5),
          ),
        ],
      ),
    );
  }
}

class Movielist extends StatelessWidget {
  const Movielist({
    Key? key,
    required this.futre,
  }) : super(key: key);

  final Future futre;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futre,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          return SizedBox(
            height: 190,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDescription(
                                  id: snapshot.data[index].id,
                                )),
                      );
                    },
                    child: Container(
                      width: 110,
                      margin:
                          const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${snapshot.data[index].posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else {
          return SizedBox(
            height: 190,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(width: 2),
                itemBuilder: (context, index) {
                  return Container(
                    width: 115,
                    margin:
                        const EdgeInsets.only(left: 5, right: 10, bottom: 10),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: Image.asset('assets/defaultimage.png',
                          fit: BoxFit.cover),
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}

class TVlist extends StatelessWidget {
  const TVlist({
    Key? key,
    required this.futre,
  }) : super(key: key);

  final Future futre;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futre,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          return SizedBox(
            height: 190,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TVDescription(
                                  id: snapshot.data[index].id,
                                )),
                      );
                    },
                    child: Container(
                      width: 115,
                      margin:
                          const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${snapshot.data[index].posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else {
          return SizedBox(
            height: 190,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(width: 2),
                itemBuilder: (context, index) {
                  return Container(
                    width: 115,
                    margin:
                        const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: Image.asset('assets/defaultimage.png',
                          fit: BoxFit.cover),
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}

class Mixedlist extends StatelessWidget {
  const Mixedlist({
    Key? key,
    required this.futre,
  }) : super(key: key);

  final Future futre;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futre,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              const CustomBar(str1: 'Favorite', str2: 'List',),
              SizedBox(
                height: 190,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data.favorite.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (snapshot.data.favorite[index].type == 'tv')?TVDescription(
                                  id: snapshot.data.favorite[index].id,
                                ):MovieDescription(id: snapshot.data.favorite[index].id,)),
                          );
                        },
                        child: Container(
                          width: 115,
                          margin:
                          const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                          child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500/${snapshot.data.favorite[index].image}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const CustomBar(
                str1: 'Watchlist',
                str2: 'List',
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data.watchlist.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (snapshot.data.watchlist[index].type == 'tv')?TVDescription(
                                  id: snapshot.data.watchlist[index].id,
                                ):MovieDescription(id: snapshot.data.watchlist[index].id,)),
                          );
                        },
                        child: Container(
                          width: 115,
                          margin:
                          const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                          child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500/${snapshot.data.watchlist[index].image}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              const CustomBar(str1: 'Favorite', str2: 'List',),
              SizedBox(
                height: 190,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (context, index) => const SizedBox(width: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 115,
                        margin:
                        const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          child: Image.asset('assets/defaultimage.png',
                              fit: BoxFit.cover),
                        ),
                      );
                    }),
              ),
              const CustomBar(
                str1: 'Watchlist',
                str2: 'List',
              ),
              SizedBox(
                height: 190,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (context, index) => const SizedBox(width: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 115,
                        margin:
                        const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          child: Image.asset('assets/defaultimage.png',
                              fit: BoxFit.cover),
                        ),
                      );
                    }),
              ),

            ],
          );
        }
      },
    );
  }
}

class Genrelist extends StatelessWidget {
  const Genrelist({Key? key, required this.media}) : super(key: key);
  final String media;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService().getGenreList(media),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return ListView.separated(
                padding: const EdgeInsets.only(top: 20, bottom: 80),
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: snapshot.data.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12.5),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (media == 'movie') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GridPage(
                                  type: 'movie',
                                  title: 'MOVIE: ${snapshot.data[index].name}',
                                  future: ApiService().getMovieByGenre(
                                      snapshot.data[index].id.toString()))),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GridPage(
                                    type: 'tv',
                                    title: 'TV: ${snapshot.data[index].name}',
                                    future: ApiService().getTVByGenre(
                                        snapshot.data[index].id.toString()),
                                  )),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.blueGrey)),
                      child: Center(
                        child: Text(
                          snapshot.data[index].name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 4),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Container();
          }
        });
  }
}

class Seasonlist extends StatelessWidget {
  const Seasonlist({Key? key, required this.season, required this.id}) : super(key: key);

  final String id;
  final String season;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService().getTVepisodeBySeason(id, season),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewExampleTV(
                                  id: snapshot.data[index].id.toString(),
                                )),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 200,
                      margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/${snapshot.data[index].stillPath}')),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          const Center(
                            child: Icon(
                              Icons.play_circle_outlined,
                              size: 50,
                              color: Colors.tealAccent,
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 3)
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "  Episode-${snapshot.data[index].episodeNumber}",
                              style: const TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  shadows: [
                                    Shadow(color: Colors.black, blurRadius: 3)
                                  ]),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }));
          } else {
            return Container();
          }
        });
  }
}


// class HorizontalSlider extends StatefulWidget {
//   const HorizontalSlider({Key? key}) : super(key: key);
//
//   @override
//   State<HorizontalSlider> createState() => _HorizontalSliderState();
// }
// class _HorizontalSliderState extends State<HorizontalSlider> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         FutureBuilder(
//             future: ApiService().getTrendingAll(),
//             builder: (context, AsyncSnapshot snapshot) {
//               if (snapshot.hasData) {
//                 return CarouselSlider.builder(
//                   itemCount: 10,
//                   itemBuilder: (BuildContext context, int itemIndex,
//                       int pageViewIndex) =>
//                       InkWell(
//                         onTap: () {
//                           if (snapshot.data[itemIndex].mediaType == 'movie') {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => MovieDescription(
//                                     id: snapshot.data[itemIndex].id,
//                                   )),
//                             );
//                           } else {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => TVDescription(
//                                     id: snapshot.data[itemIndex].id,
//                                   )),
//                             );
//                           }
//                         },
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(horizontal: 5),
//                           child: ClipRRect(
//                             borderRadius:
//                             const BorderRadius.all(Radius.circular(20.0)),
//                             child: Stack(
//                               children: <Widget>[
//                                 Image(
//                                   fit: BoxFit.fill,
//                                   image: CachedNetworkImageProvider(
//                                     'https://image.tmdb.org/t/p/original/${snapshot.data[itemIndex].posterPath}',
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                   options: CarouselOptions(
//                     aspectRatio: 9 / 9,
//                     autoPlay: true,
//                     viewportFraction: 0.8,
//                     onPageChanged: (index, reason) {
//                       setState(() {
//                         dot = index.toDouble();
//                       });
//                     },
//                   ),
//                 );
//               } else {
//                 return CarouselSlider.builder(
//                   itemCount: 10,
//                   itemBuilder: (BuildContext context, int itemIndex,
//                       int pageViewIndex) =>
//                       Container(
//                         width: 270,
//                         margin: const EdgeInsets.symmetric(vertical: 10),
//                       ),
//                   options: CarouselOptions(
//                     aspectRatio: 9 / 9,
//                     autoPlay: true,
//                     viewportFraction: 0.9,
//                   ),
//                 );
//               }
//             }),
//         Container(
//           margin: const EdgeInsets.only(
//             top: 10,
//           ),
//           alignment: Alignment.bottomCenter,
//           child: DotsIndicator(
//             dotsCount: 10,
//             position: dot,
//             decorator: DotsDecorator(
//               activeColor: Colors.blueGrey,
//               color: Colors.grey,
//               size: const Size.square(9.0),
//               activeSize: const Size(18.0, 9.0),
//               activeShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5.0)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
// Widget Card(String title, ImageProvider image) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Container(
//         height: 150,
//         width: 100,
//         margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
//         decoration: BoxDecoration(
//           image: DecorationImage(fit: BoxFit.cover, image: image),
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       SizedBox(
//         width: 100,
//         child: Text(
//           title,
//           style: const TextStyle(color: Colors.white),
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           textAlign: TextAlign.center,
//         ),
//       )
//     ],
//   );
// }
// class CustomSlider extends StatelessWidget {
//   CustomSlider(this.future, {super.key});
//   Future<List<Mixed>> future;
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SizedBox(
//       width: size.width,
//       height: size.height * 0.33,
//       child: FutureBuilder(
//           future: future,
//           builder: ((context, AsyncSnapshot snapshot) {
//             if (snapshot.hasData) {
//               return PageView.builder(
//                 scrollDirection: Axis.horizontal,
//                 physics: const BouncingScrollPhysics(),
//                 pageSnapping: true,
//                 itemCount: snapshot.data.length,
//                 itemBuilder: ((context, index) {
//                   return InkWell(
//                     onTap: () {
//                       if (snapshot.data[index].mediaType == 'movie') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => MovieDescription(
//                                     id: snapshot.data[index].id,
//                                   )),
//                         );
//                       } else {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => TVDescription(
//                                     id: snapshot.data[index].id,
//                                   )),
//                         );
//                       }
//                     },
//                     child: SizedBox(
//                       height: size.height * 0.33,
//                       width: size.width,
//                       child: Stack(
//                         children: [
//                           Container(
//                             width: size.width,
//                             height: size.height * 0.33,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: NetworkImage(
//                                         'https://image.tmdb.org/t/p/original/${snapshot.data[index].backdropPath}'))),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   begin: Alignment.center,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.transparent,
//                                     Colors.black.withOpacity(0.50),
//                                     Colors.black.withOpacity(0.75),
//                                     Colors.black
//                                   ]),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                                 top: size.height * 0.28, left: 15),
//                             width: size.width * 0.6,
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 4, horizontal: 4),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(color: Colors.redAccent)),
//                             child: Text(
//                               snapshot.data[index].title,
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                   letterSpacing: 5,
//                                   overflow: TextOverflow.ellipsis),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//               );
//             } else {
//               return PageView.builder(
//                   itemCount: 1,
//                   itemBuilder: ((context, index) {
//                     return Container();
//                   }));
//             }
//           })),
//     );
//   }
// }
//
// class HorizontalSlider extends StatefulWidget {
//   const HorizontalSlider({super.key});
//
//   @override
//   State<HorizontalSlider> createState() => _HorizontalSliderState();
// }
// class _HorizontalSliderState extends State<HorizontalSlider> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Container(
//         height: size.height * 0.335,
//         child: Column(
//           children: [
//             FutureBuilder(
//                 future: ApiService().getTrendingAll(),
//                 builder:
//                     (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                   if (snapshot.hasData) {
//                     return CarouselSlider.builder(
//                       options: CarouselOptions(
//                         viewportFraction: 0.85,
//                         aspectRatio: 1.6,
//                         enlargeStrategy: CenterPageEnlargeStrategy.scale,
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             dot = index.toDouble();
//                           });
//                         },
//                         enlargeCenterPage: true,
//                         scrollDirection: Axis.horizontal,
//                         autoPlay: true,
//                       ),
//                       itemCount: 10,
//                       itemBuilder:
//                           (BuildContext context, int index, int realIndex) {
//                         return InkWell(
//                           onTap: () {
//                             if (snapshot.data[index].mediaType == 'movie') {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => MovieDescription(
//                                           id: snapshot.data[index].id,
//                                         )),
//                               );
//                             } else {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => TVDescription(
//                                           id: snapshot.data[index].id,
//                                         )),
//                               );
//                             }
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: CachedNetworkImageProvider(
//                                         'https://image.tmdb.org/t/p/original/${snapshot.data[index].backdropPath}'))),
//                           ),
//                         );
//                       },
//                     );
//                   } else {
//                     return Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         image: const DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/defaultimage.png'),
//                         ),
//                       ),
//                     );
//                   }
//                 }),
//             Container(
//               margin: const EdgeInsets.only(
//                 top: 10,
//               ),
//               width: size.width,
//               alignment: Alignment.bottomCenter,
//               child: DotsIndicator(
//                 dotsCount: 10,
//                 position: dot,
//                 decorator: DotsDecorator(
//                   activeColor: Colors.blueGrey,
//                   color: Colors.grey,
//                   size: const Size.square(9.0),
//                   activeSize: const Size(18.0, 9.0),
//                   activeShape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0)),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }