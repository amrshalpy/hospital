import 'package:flutter/material.dart';
import 'package:hms/constants/constants.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
     Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -6,
            right: -6,
            child: Image.asset(
              "assets/images/top1.png",
              width: size.width,
              color: kMainColor,
            ),
          ),
          Positioned(
            top: -6,
            right: -6,
            child: Image.asset(
              "assets/images/top2.png",
              width: size.width,
              color: kMainColor,

            ),
          ),
          /*Positioned(
            top: 50,
            right: 30,
            child: Image.asset(
              "assets/images/login.png",
              width: size.width * 0.35
            ),
          ),*/
          Positioned(
            bottom: -6,
            right: 0,
            left: -6,
            child: Image.asset(
              "assets/images/bottom1.png",
              width: size.width,
              color: kMainColor,

            ),
          ),
          Positioned(
            bottom: -6,
            right: 0,
            left: -6,

            child: Image.asset(
              "assets/images/bottom2.png",
              width: size.width,
              color: kMainColor,
            ),
          ),
          child
        ],
      ),
    );
  }
}