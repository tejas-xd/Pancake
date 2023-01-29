import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pancake/data_handling/apiservices.dart';
import 'package:pancake/shared/customwidgets.dart';
import 'package:provider/provider.dart';

import '../googlesignin.dart';

class Morescreenbody extends StatefulWidget {
  const Morescreenbody({Key? key}) : super(key: key);

  @override
  State<Morescreenbody> createState() => _MorescreenbodyState();
}

class _MorescreenbodyState extends State<Morescreenbody> {
  @override
  Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection('Users').snapshots();
  final user = FirebaseAuth.instance.currentUser!;
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            children: const [
              Icon(
                Icons.account_circle_outlined,
                color: Colors.tealAccent,
              ),
              SizedBox(
                width: 10,
              ),
              Text("PROFILE",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.tealAccent)),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: stream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading...');
            }
            if (snapshot.hasData) {
              snapshot.data!.docs.forEach((element) {
                print(element.data());
              });
              return Text('Data Loaded');
            }
            return Container();
          },
        ),
        Container(
          height: size.height * 0.1,
          margin: const EdgeInsets.only(left: 15, top: 5),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.displayName!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(user.email!),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomBar(str1: 'Favorite', str2: 'List',),
        Movielist(
          futre: ApiService().getTrendingMovie(),
        ),
        const CustomBar(
          str1: 'Watchlist',
          str2: 'List',
        ),
        TVlist(
          futre: ApiService().getTrendingTVshow(),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 15),
            child: Row(
              children: const [
                Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Logout",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.red)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
