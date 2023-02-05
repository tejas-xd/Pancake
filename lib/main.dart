import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pancake/homescreen.dart';
import 'package:flutter/services.dart';
import 'package:pancake/shared/customvalues.dart';


void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          canvasColor: xcanvas,
          textTheme: TextTheme(
            bodyText1: GoogleFonts.poppins(),
            bodyText2: GoogleFonts.poppins(),
          )
      ),
      debugShowCheckedModeBanner: false,
      home: const Homescreen(),
    );
  }
}
