import 'package:flutter/material.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'package:pancake/homescreen.dart';
import 'package:pancake/shared/customgridview.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:pancake/shared/customwidgets.dart';

class Morescreenbody extends StatefulWidget {
  const Morescreenbody({Key? key}) : super(key: key);

  @override
  State<Morescreenbody> createState() => _MorescreenbodyState();
}

class _MorescreenbodyState extends State<Morescreenbody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MODE',
            style: TextStyle(color: uppermodecolor, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    canvasmodecolor = Colors.white54;
                    uppermodecolor = lightmode;
                    oppositecolor =Colors.white70;
                    selectedbackimg = backimage[0];
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homescreen(index: 2),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child:  Center(
                    child: Text(
                      'LIGHT MODE',
                      style: TextStyle(fontSize: 15, color: uppermodecolor),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    canvasmodecolor = Colors.black54;
                    uppermodecolor = darkmode;
                    oppositecolor =Colors.black54;
                    selectedbackimg = backimage[1];
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Homescreen(
                              index: 2,
                            )),
                  );
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child:  Center(
                    child: Text(
                      'DARK MODE',
                      style: TextStyle(fontSize: 15, color: uppermodecolor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
