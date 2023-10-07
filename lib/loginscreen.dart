import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/zocial_icons.dart';
import 'package:pancake/googlesignin.dart';
import 'package:pancake/homescreen.dart';
import 'package:pancake/shared/customvalues.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Container(
                    height: size.height * 0.06,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Image.asset('assets/appbar.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'All your favorite films in one click',
                      style: TextStyle(
                          color: xlowtext,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 5),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.5,
                child: const Image(
                  image: AssetImage('assets/login-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: Container(
                    width: size.width * 0.8,
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                      },
                      icon: const Icon(FontAwesome.google),
                      label: const Text(
                        'Google sign-in',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          backgroundColor: const Color(0xFF2A292F)),
                    )),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Center(
                child: Container(
                    width: size.width * 0.8,
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homescreen()),
                        );
                      },
                      icon: const Icon(Zocial.guest),
                      label: const Text(
                        "Continue as Guest",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          backgroundColor: const Color(0xFF2A292F)),
                    )),
              ),
              const SizedBox(),
            ],
          ),
        ));
  }
}
