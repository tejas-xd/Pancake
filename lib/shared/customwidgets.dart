import 'package:flutter/material.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:pancake/shared/movie_detailscreen.dart';
import 'package:pancake/shared/tvshow_detailscreen.dart';

class ListViewDatamovie extends StatelessWidget {
  const ListViewDatamovie({
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
                            builder: (context) => MovieDescription(id: snapshot.data[index].id,)),
                      );
                    },
                    child: Container(
                      width: 115,
                      margin: const EdgeInsets.only(
                          left: 10, right: 5, bottom: 10),
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
                separatorBuilder: (context, index) =>
                const SizedBox(width: 2),
                itemBuilder: (context, index) {
                  return Container(
                    width: 115,
                    margin: const EdgeInsets.only(
                        left: 5, right: 10, bottom: 10),
                    child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      child: Image.asset('assets/custommovieimage.png',fit: BoxFit.cover),),
                  );
                }),
          );
        }
      },
    );
  }
}

class ListViewDatatv extends StatelessWidget {
  const ListViewDatatv({
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
                            builder: (context) => TVDescription(id: snapshot.data[index].id,)),
                      );
                    },
                    child: Container(
                      width: 115,
                      margin: const EdgeInsets.only(
                          left: 10, right: 5, bottom: 10),
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
                separatorBuilder: (context, index) =>
                const SizedBox(width: 2),
                itemBuilder: (context, index) {
                  return Container(
                    width: 115,
                    margin: const EdgeInsets.only(
                        left: 10, right: 5, bottom: 10),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      child: Image.asset('assets/custommovieimage.png',fit: BoxFit.cover),),
                  );
                }),
          );
        }
      },
    );
  }
}

class Namebar extends StatelessWidget {
  const Namebar({Key? key, required this.namebar, required this.navigate})
      : super(key: key);

  final String namebar;
  final Widget navigate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            namebar,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w300,
              color: uppermodecolor,
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => navigate),
              );
            },
            child: Text(
              'see all',
              style: TextStyle(
                  fontSize: 20,
                  color: uppermodecolor,
                  fontWeight: FontWeight.w200),
            )),
      ],
    );
  }
}

class Backgroupimage extends StatelessWidget {
  const Backgroupimage({Key? key, required this.imageback}) : super(key: key);

  final String imageback;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            imageback,
          )),
    ));
  }
}
