import 'package:flutter/material.dart';
import 'package:pancake/homescreen.dart';
import 'package:flutter/services.dart';


void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Homescreen(index: 0);
  }
}
