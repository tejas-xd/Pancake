import 'package:flutter/material.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:pancake/shared/movie_detailscreen.dart';
import 'package:pancake/shared/tvshow_detailscreen.dart';

class GridViewDatamovie extends StatelessWidget {
  const GridViewDatamovie({
    Key? key,
    required this.future,
  }) : super(key: key);

  final Future future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return const Center(
              child: Text(
                "NOT FOUND",
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 5),
              ),
            );
          } else {
            return GridView.builder(
                padding: const EdgeInsets.only(top: 10, bottom: 80),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150, childAspectRatio: 0.7),
                itemCount:
                    (snapshot.data.length > 18) ? 18 : snapshot.data.length,
                itemBuilder: (context, index) {
                  if (snapshot.data[index].posterPath == null) {
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
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: mode,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin: const EdgeInsets.only(
                            left: 5, right: 10, bottom: 10),
                        child: Center(
                            child: Text(
                          '${snapshot.data[index].title}',
                          style: const TextStyle(fontSize: 20),
                        )),
                      ),
                    );
                  } else {
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
                        margin: const EdgeInsets.only(
                            left: 5, right: 10, bottom: 10),
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
                  }
                });
          }
        } else {
          return Container();
        }
      },
    );
  }
}

class GridViewDatatv extends StatelessWidget {
  const GridViewDatatv({
    Key? key,
    required this.future,
  }) : super(key: key);

  final Future future;
  final String title = "TV";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return const Center(
              child: Text(
                "NOT FOUND",
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 5),
              ),
            );
          } else {
            return GridView.builder(
                padding: const EdgeInsets.only(top: 10, bottom: 80),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150, childAspectRatio: 0.7),
                itemCount:
                    (snapshot.data.length > 18) ? 18 : snapshot.data.length,
                itemBuilder: (context, index) {
                  if (snapshot.data[index].posterPath == null) {
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
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: mode,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin: const EdgeInsets.only(
                            left: 5, right: 10, bottom: 10),
                        child: Center(
                            child: Text(
                          '${snapshot.data[index].name}',
                          style: const TextStyle(fontSize: 20),
                        )),
                      ),
                    );
                  } else {
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
                        margin: const EdgeInsets.only(
                            left: 5, right: 10, bottom: 10),
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
                  }
                });
          }
        } else {
          return Container();
        }
      },
    );
  }
}

class GridPage extends StatelessWidget {
  GridPage(
      {Key? key, required this.title, required this.future, required this.type})
      : super(key: key);

  String title;
  Future future;
  String type;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: xcanvas),
      home: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(size.width * 0.6, size.height * 0.1),
            child: Container(
                width: size.width * 0.6,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.teal)),
                child:  Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                )),
          ),
          body: Container(
            height: size.height * 0.9,
            child: (type == 'movie')
                ? (GridViewDatamovie(future: future))
                : (GridViewDatatv(future: future)),
          ),
        ),
      ),
    );
  }
}
