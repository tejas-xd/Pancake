import 'package:flutter/material.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:pancake/shared/customwidgets.dart';
import 'package:pancake/shared/movie_detailscreen.dart';
import 'package:pancake/shared/tvshow_detailscreen.dart';

class GridViewDatamovie extends StatefulWidget {
  const GridViewDatamovie({
    Key? key,
    required this.futre,
  }) : super(key: key);

  final Future futre;

  @override
  State<GridViewDatamovie> createState() => _GridViewDatamovieState();
}

class _GridViewDatamovieState extends State<GridViewDatamovie> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: Colors.black54),
      home: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
              preferredSize: const Size(500, 90),
              child: Container(
                height: 45,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Image.asset('assets/appbar.png'),
              )),
          body: Stack(
            children:[
              Backgroupimage(imageback: selectedbackimg),
              FutureBuilder(
              future: widget.futre,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              child:
                                  Image(image: AssetImage('assets/notfound.png'))),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }
                  else
                  {
                    return Column(
                      children: [
                        SizedBox(
                          height: 800,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 150,
                                      childAspectRatio: 0.7),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                if (snapshot.data[index].posterPath == null) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDescription(
                                                  id: snapshot.data[index].id,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: uppermodecolor,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
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
                                            builder: (context) =>
                                                MovieDescription(
                                                  id: snapshot.data[index].id,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 10, bottom: 10),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w500/${snapshot.data[index].posterPath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                        ),
                      ],
                    );
                  }
                } else {
                  return const SizedBox(
                    height: 200,
                  );
                }
              },
            ),
          ]
          ),
        ),
      ),
    );
  }
}


class GridViewDatatv extends StatefulWidget {
  const GridViewDatatv({
    Key? key,
    required this.futre,
  }) : super(key: key);

  final Future futre;

  @override
  State<GridViewDatatv> createState() => _GridViewDatatvState();
}

class _GridViewDatatvState extends State<GridViewDatatv> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: Colors.black54),
      home: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
              preferredSize: const Size(500, 90),
              child: Container(
                height: 45,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Image.asset('assets/appbar.png'),
              )),
          body: Stack(
              children:[
                Backgroupimage(imageback: selectedbackimg),
                FutureBuilder(
                  future: widget.futre,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length == 0) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                               ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  child:
                                  Image(image: AssetImage('assets/notfound.png'))),
                               SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        );
                      }
                      else
                      {
                        return Column(
                          children: [
                            SizedBox(
                              height: 800,
                              child: GridView.builder(
                                  gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 150,
                                      childAspectRatio: 0.7),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    if (snapshot.data[index].posterPath == null) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TVDescription(
                                                      id: snapshot.data[index].id,
                                                    )),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color: uppermodecolor,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
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
                                                builder: (context) =>
                                                    TVDescription(
                                                      id: snapshot.data[index].id,
                                                    )),
                                          );
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 5, right: 10, bottom: 10),
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(5.0)),
                                            child: Image.network(
                                              'https://image.tmdb.org/t/p/w500/${snapshot.data[index].posterPath}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  }),
                            ),
                          ],
                        );
                      }
                    } else {
                      return const SizedBox(
                        height: 200,
                      );
                    }
                  },
                ),
              ]
          ),
        ),
      ),
    );
  }
}


// class GridViewDatatv extends StatelessWidget {
//   const GridViewDatatv({
//     Key? key,
//     required this.futre,
//   }) : super(key: key);
//
//   final Future futre;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(canvasColor: Colors.black54),
//       home: SafeArea(
//         child: Scaffold(
//           appBar: PreferredSize(
//               preferredSize: const Size(500, 90),
//               child: Container(
//                 height: 45,
//                 margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                 child: Image.asset('assets/appbar.png'),
//               )),
//           body: FutureBuilder(
//             future: futre,
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.hasData) {
//                 return GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithMaxCrossAxisExtent(
//                             maxCrossAxisExtent: 150, childAspectRatio: 0.7),
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (context, index) {
//                       if (snapshot.data[index].posterPath == null) {
//                         return InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => TVDescription(
//                                         id: snapshot.data[index].id,
//                                       )),
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius:
//                               const BorderRadius.all(Radius.circular(5.0)),
//                               color: uppermodecolor,
//                             ),
//                             padding: const EdgeInsets.only(left: 10),
//                             margin: const EdgeInsets.only(
//                                 left: 5, right: 10, bottom: 10),
//                             child: Center(
//                                 child: Text(
//                               '${snapshot.data[index].name}',
//                               style: const TextStyle(fontSize: 20),
//                             )),
//                           ),
//                         );
//                       } else {
//                         return InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => TVDescription(
//                                         id: snapshot.data[index].id,
//                                       )),
//                             );
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.only(
//                                 left: 5, right: 10, bottom: 10),
//                             child: ClipRRect(
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(5.0)),
//                               child: Image.network(
//                                 'https://image.tmdb.org/t/p/w500/${snapshot.data[index].posterPath}',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         );
//                       }
//                     });
//               } else {
//                 return const SizedBox(
//                   height: 200,
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
