import 'package:flutter/material.dart';
import 'package:pancake/googlesignin.dart';
import 'package:provider/provider.dart';
import 'googlesignin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(150.0)),
                child: Image.asset('assets/login-banner.gif', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
              child: Container(
                height: 50,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10.0),

                ),
                child: const Center(
                  child: Text(
                    'Google sign-in',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.tealAccent,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}