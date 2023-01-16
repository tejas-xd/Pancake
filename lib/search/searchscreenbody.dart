import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'package:pancake/shared/customgridview.dart';
import 'package:pancake/shared/customvalues.dart';

class Searchscreenbody extends StatefulWidget {
  const Searchscreenbody({Key? key}) : super(key: key);

  @override
  State<Searchscreenbody> createState() => _SearchscreenbodyState();
}

class _SearchscreenbodyState extends State<Searchscreenbody> {
  final myController = TextEditingController();
  String query = "";

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  String mediatype = 'movie';
  Color moviebutton = Colors.redAccent;
  Color tvbutton = Colors.white38;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.height.toString());
    return Container(
      height: size.height,
      child: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.fromLTRB(8, 28, 8, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green.withOpacity(0.5),
            ),
            child: TextField(
              controller: myController,
              cursorColor: Colors.green,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                  suffixIconColor: Colors.white,
                  prefixIconColor: Colors.white),
              onChanged: (value) {
                setState(() {
                  query = myController.text;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    mediatype = 'movie';
                    moviebutton = Colors.redAccent;
                    tvbutton = Colors.white38;
                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: moviebutton,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.movie,
                          color: uppermodecolor,
                          size: 50,
                        ),
                        Text(
                          'MOVIE',
                          style: TextStyle(fontSize: 15, color: uppermodecolor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    mediatype = 'tv';
                    moviebutton = Colors.white38;
                    tvbutton = Colors.redAccent;
                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: tvbutton,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.tv,
                          color: uppermodecolor,
                          size: 50,
                        ),
                        Text(
                          'TV SHOW',
                          style: TextStyle(fontSize: 15, color: uppermodecolor),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: size.height*0.65,
            child: FutureBuilder(
                future: ApiService().getGenreList(mediatype),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 12.5,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (mediatype == 'movie') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GridViewDatamovie(
                                          futre: ApiService().getMovieByGenre(snapshot.data[index].id.toString()))),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GridViewDatatv(
                                        futre: ApiService().getTVByGenre(
                                            snapshot.data[index].id
                                                .toString()),)),
                                );
                              }
                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Text(
                                  snapshot.data[index].name,
                                  style: TextStyle(
                                      fontSize: 20, color: uppermodecolor,fontWeight: FontWeight.w200),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Container();
                  }
                }),
          )
        ],
      )
    );
  }
}
