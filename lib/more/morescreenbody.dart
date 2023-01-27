import 'package:flutter/material.dart';


class Morescreenbody extends StatefulWidget {
  const Morescreenbody({Key? key}) : super(key: key);

  @override
  State<Morescreenbody> createState() => _MorescreenbodyState();
}

class _MorescreenbodyState extends State<Morescreenbody> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: NetworkImage('https://media.tenor.com/OeFm9wUArQgAAAAi/watching-movies-popcorns.gif'),
      ),
    );
  }
}
