import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_state.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'package:pancake/shared/movie_detailscreen.dart';
import 'package:pancake/shared/tvshow_detailscreen.dart';
import 'package:pancake/data_handeling/models/models.dart';


class CustomSlider extends StatelessWidget {
  CustomSlider(this.future, {super.key});
  Future<List<Mixed>> future;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.33,
      child: FutureBuilder(
          future: future,
          builder: ((context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                pageSnapping: true,
                itemCount: snapshot.data.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      if (snapshot.data[index].mediaType == 'movie') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDescription(
                                id: snapshot.data[index].id,
                              )),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TVDescription(
                                id: snapshot.data[index].id,
                              )),
                        );
                      }
                    },
                    child: SizedBox(
                      height: size.height * 0.33,
                      width: size.width,
                      child: Stack(
                        children: [
                          Container(
                            width: size.width,
                            height: size.height * 0.33,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/original/${snapshot.data[index].backdropPath}'))),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.50),
                                    Colors.black.withOpacity(0.75),
                                    Colors.black
                                  ]),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: size.height * 0.28,left: 15),
                            width: size.width * 0.6,
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.redAccent)),
                            child: Text(
                              snapshot.data[index].title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 5,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            } else {
              return PageView.builder(
                  itemCount: 1,
                  itemBuilder: ((context, index) {
                    return Container();
                  }));
            }
          })),
    );
  }
}

class HorizontalSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        child: FutureBuilder(
            future: ApiService().getTrendingAll(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasData) {
                return CarouselSlider.builder(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return InkWell(
                      onTap: () {
                        if (snapshot.data[index].mediaType == 'movie') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDescription(
                                      id: snapshot.data[index].id,
                                    )),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TVDescription(
                                      id: snapshot.data[index].id,
                                    )),
                          );
                        }
                      },
                      child: SizedBox(
                        height: size.height * 0.33,
                        width: size.width,
                        child: Stack(
                          children: [
                            Container(
                              width: size.width,
                              height: size.height * 0.33,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                          'https://image.tmdb.org/t/p/original/${snapshot
                                              .data[index].backdropPath}'))),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.50),
                                      Colors.black.withOpacity(0.75),
                                      Colors.black
                                    ]),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: size.height * 0.20,),
                              width: size.width,
                              alignment: Alignment.bottomCenter,
                              child: DotsIndicator(
                                dotsCount: 10,
                                position: index.toDouble(),
                                decorator: DotsDecorator(
                                  activeColor: Colors.redAccent,
                                  color: Colors.white,
                                  size: const Size.square(9.0),
                                  activeSize: const Size(18.0, 9.0),
                                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              else
              {
                return Container(
                  height: size.height*0.33,
                );
              }
            }
        )
    );
  }
}

class CustomBar extends StatelessWidget {
  const CustomBar(
      {Key? key,
        required this.str1,
        required this.str2,
        required this.navigate})
      : super(key: key);

  final String str1;
  final String str2;
  final Widget navigate;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 8,top: 8,bottom: 8,right: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 5),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigate),
                );
              },
              child: Text(
                "see all ",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    ),
              ),

              ),
          ],
        ));
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
                itemCount: 15,
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
                      child: Image.asset('assets/custommovieimage.png',
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
                itemCount: 15,
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
                      child: Image.asset('assets/custommovieimage.png',
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

Widget Card(String title, ImageProvider image) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 150,
        width: 100,
        margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: image),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      SizedBox(
        width: 100,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      )
    ],
  );
}


