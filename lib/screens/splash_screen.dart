import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hms/components/splash_screen_bottom_bg.dart';
import 'package:hms/constants/api_key.dart';
import 'package:hms/screens/home.dart';
import 'package:hms/screens/intro_slider.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 4),
        () => {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      uid != null ? HomePage() : IntroSliderPage()))
            });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 20.0,
                  right: 16.0,
                  left: 16.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Lottie.asset('assets/images/splash.json'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "I-Clinic",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SplashScreenBottomBg(),
        ],
      ),
    );
  }
}
