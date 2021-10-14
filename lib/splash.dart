import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_disol/home.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    _navigateToAuthScreen(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 177, 31, 1),
      body: Center(
        child: FadeTransition(
          opacity: animationController.drive(CurveTween(curve: Curves.easeOut)),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  height: 75,
                  image: AssetImage('assets/icon/launcher_icon.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('DISOL',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 75,
                        color: Color.fromRGBO(0, 126, 122, 1),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToAuthScreen(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(Home.route));
    print('object');
  }
}
