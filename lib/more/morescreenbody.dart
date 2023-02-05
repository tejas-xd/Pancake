
import 'package:flutter/material.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'package:pancake/shared/customwidgets.dart';


class Morescreenbody extends StatefulWidget {
  const Morescreenbody({Key? key}) : super(key: key);

  @override
  State<Morescreenbody> createState() => _MorescreenbodyState();
}

class _MorescreenbodyState extends State<Morescreenbody> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
      ],
    );
  }
}