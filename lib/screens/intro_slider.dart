import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hms/screens/home.dart';
import 'package:hms/screens/admin_login/login_screen.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:lottie/lottie.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({Key? key}) : super(key: key);

  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  List<Slide> slides = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(new Slide(
        title: "الطاقم الطبي ",
        description: "تسجيل بيانات الطاقم الطبي ",
        pathImage: "assets/images/doctors.json"));
    slides.add(new Slide(
        title: "الكشوفات ",
        description: "تسجيل بيانات الطاقم الطبي ",
        pathImage: "assets/images/item1.json"));
    slides.add(new Slide(
        title: "الرعاية الطبية ",
        description: "تسجيل بيانات الطاقم الطبي ",
        pathImage: "assets/images/item3.json"));
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];

    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: EdgeInsets.only(bottom: 120, top: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Lottie.asset(currentSlide.pathImage.toString()),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    currentSlide.title.toString(),
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    currentSlide.description.toString(),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: Colors.white,
      renderSkipBtn: Text(
        "تخطي",
        style: TextStyle(
            color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      renderNextBtn: Text(
        "  التالي",
        style: TextStyle(
            color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      renderDoneBtn: Text(
        "الدخول",
        style: TextStyle(
            color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      colorDot: Colors.black54,
      colorActiveDot: Colors.black54,
      sizeDot: 7.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: this.renderListCustomTabs(),
      scrollPhysics: BouncingScrollPhysics(),
      hideStatusBar: false,
      onDonePress: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LogInScreen(),
        ),
      ),
    );
  }
}
