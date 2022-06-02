import 'package:flutter/material.dart';
import 'package:hms/constants/constants.dart';
import 'package:lottie/lottie.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      width: 255,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,  
        children: [
              Lottie.asset(
                'assets/images/pict.json'),



        ],
      ),
    );
  }
}
