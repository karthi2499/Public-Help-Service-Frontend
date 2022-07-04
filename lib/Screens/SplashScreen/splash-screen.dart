import 'dart:ui';
import 'package:flutter/material.dart';

// IMPORTING AUTH
import 'package:finalyearproject/Auth/firebase-auth.dart';

// IMPORTING AUTH BUTTONS
import 'package:auth_buttons/auth_buttons.dart';

// IMPORTING GOOGLE FONTS
import 'package:google_fonts/google_fonts.dart';

// IMPORTING WIDGETS
import 'package:finalyearproject/Widgets/export-widgets.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> topCircelAnimation;
  late Animation<double> bottomCircelAnimation;
  late Animation<double> logoAnimation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    topCircelAnimation = Tween<double>(begin: 0, end: 200).animate(controller)
      ..addListener(() {
        setState(() {
          print(topCircelAnimation.value);
        });
      });

    bottomCircelAnimation =
    Tween<double>(begin: 0, end: 350).animate(controller)
      ..addListener(() {
        setState(() {
          print(bottomCircelAnimation.value);
        });
      });

    logoAnimation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          print(logoAnimation.value);
        });
      });
    controller.forward();

    /* SPLASH SCREEN DISABLED DUE TO AUTH */

    // Timer(const Duration(seconds: 5), () {
    //   Navigator.of(context).pushReplacement(
    //     new MaterialPageRoute(
    //       builder: (BuildContext context) => new LoginScreen(),
    //     ),
    //   );
    // });

    /* SPLASH SCREEN DISABLED DUE TO AUTH */

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3b5059),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
                children: <Widget>[
                  Center(
                    child: Opacity(
                      opacity: logoAnimation.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/logo.png',
                            height: 200,
                            width: 200,
                            //color: Colors.blue,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              'Public Help Service',
                              style: GoogleFonts.ubuntu(fontSize: 25, fontWeight: FontWeight.w600, letterSpacing: 2.0, color: Colors.white)
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: _signInButton(),
          )
        ],
      )
    );
  }

  Widget _signInButton() {
    return GoogleAuthButton(
      text: "Continue with Google",
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return SalomonBottomNavigationBar();
                },
              ),
            );
          }
        });
      },
      style: AuthButtonStyle(
        iconType: AuthIconType.secondary,
      ),
    );
  }

}