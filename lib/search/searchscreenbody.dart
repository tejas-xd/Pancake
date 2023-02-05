import 'package:flutter/material.dart';
import 'package:pancake/data_handling/apiservices.dart';
import 'package:pancake/shared/customgridview.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:pancake/shared/customwidgets.dart';

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


  Color moviebutton = Colors.blueGrey;
  Color tvbutton = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height*0.06,
        ),
        Container(
          height: size.height*0.06,
          width: size.width * 0.9,
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black),
            color: xbnavbar,
          ),
          child: Center(
            child: TextField(
              controller: myController,
              cursorColor: Colors.black,
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
                  prefixIconColor: Colors.white),
              onChanged: (value) {
                setState(() {
                  query = myController.text;
                });
              },
              onSubmitted:(value) {
              },
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  mediatype = 'movie';
                  moviebutton = Colors.blueGrey;
                  tvbutton = Colors.transparent;
                });
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: moviebutton,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.blueGrey)
                ),
                child: const Center(
                  child: Text(
                    'MOVIE',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  mediatype = 'tv';
                  moviebutton = Colors.transparent;
                  tvbutton = Colors.blueGrey;
                });
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: tvbutton,
                  borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.blueGrey)
                ),
                child: const Center(
                  child: Text(
                    'TV-SHOW',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: size.height * 0.8,
          child: (query=="")?Genrelist(media: mediatype,):((mediatype=='movie')?GridViewDatamovie(future: ApiService().getMovieBySearch(query, 'movie')):GridViewDatatv(future: ApiService().getTVBySearch(query, 'tv'))),
        )
      ],
    );
  }
}



