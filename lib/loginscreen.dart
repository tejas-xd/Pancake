import 'package:flutter/material.dart';
import 'package:pancake/googlesignin.dart';
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
                  height: size.height*0.06,
                ),
                Container(
                  height: size.height * 0.06,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Image.asset('assets/appbar.png'),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text('All your favorite films in one click',
                    style: TextStyle(
                      color: xlowtext,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 5),
                  textAlign: TextAlign.center,),
                )
              ],
            ),
            SizedBox(
              width: size.width,
              height: size.height*0.5,
              child: const Image(
                  image: AssetImage('assets/login-image.jpg'),
              fit: BoxFit.cover,),
            ),
            SizedBox(
              height: size.height*0.05,
            ),
            TextButton(
              onPressed: () {
                final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
              child: Container(
                height: 50,
                width: size.width*0.6,
                decoration: BoxDecoration(
                  color: xbackground,
                  borderRadius: BorderRadius.circular(10.0),

                ),
                child: const Center(
                  child: Text(
                    'Google sign-in',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(),
          ],
        ),
      )
    );
  }
}