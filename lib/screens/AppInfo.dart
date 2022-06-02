
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hms/components/background.dart';
import 'package:hms/constants/constants.dart';


class AppInfo extends StatefulWidget {
  static String id = 'ProductInfo';

  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _globalKey,
      body: Background(
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: 140.0,
                left: 0.0,
                right: 0.0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right:10),
                        child: SvgPicture.asset(
                          'assets/images/item1.svg',
                          matchTextDirection: true,
                          height: 260,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text.rich(
                            TextSpan(

                              children: [
                                TextSpan(text: 'I-Clinic\n ' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                TextSpan(
                                  text: ' لادارة المسشتفيات هو نظام متكامل لأدارة النواحي الإدارية والمالية والطبية في المستشفيات و مؤسسات الرعاية الصحية.',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                                ),
                                TextSpan(text: ' تهدف المنظومة إلي تنظيم العمل في المستشفى بما يتيح الوصول إلى بيانات المريض ومتابعته أثناء وجوده في المستشفى وتنظيم تقديم الخدمة للمريض على الوجه الأمثل ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                                TextSpan(text: 'وبأسرع وقت وتنظيم البرامج العلاجية الملائمة لكل حالة وتسهيل عمل الطبيب من خلال التسجيل الطبي لحالة المريض (الشكوى والاعراض - الفحوص والتحاليل و الأشعة - العمليات - التشخيصات - أوامر الأطباء ومتابعة تنفيذها - متابعة تقدم حالة المريض - الأدوية والتوصيات الطبية ) ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                                TextSpan(text: ' مما يسهل متابعة تطور حالة المريض الصحية و يضمن دقة وسرعة الأداء', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                              ],

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )







                    ],
                  ),
                ),
              ),   Positioned(
                top: MediaQuery.of(context).size.height-40,
                left: 0.0,
                right: 0.0,
                child:Center(child: Text('Copyright©2022  El-Raeda',style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.black87),)),
              ),
              new Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: AppBar(
                  title: Text(
                    'عن التطبيق',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 19),
                  ),
                  actions: [],
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new IconButton(
                      icon: new Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black87,
                        size: 25,
                      ),
                      onPressed: () => {
                        Navigator.of(context).pop(),
                      },
                    ),
                  ),
                  // You can add title here
                  backgroundColor: Colors.blue.withOpacity(0.0),
                  //You can make this transparent
                  elevation: 0.0, //No shadow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}