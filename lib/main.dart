import 'package:flutter/material.dart';
import 'package:pancake/homescreen.dart';
import 'package:flutter/services.dart';

//ver 2
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Homescreen();
  }
}
