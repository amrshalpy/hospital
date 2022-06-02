import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/screens/notifications/notification_model.dart';
import 'package:hms/screens/notifications/widgets/get_notification.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  List<NotificationModel> model = [
    NotificationModel(
      title: 'free delivery',
      date: '11:48 Am',
      img: 'assets/images/delivery-man.png',
      body: 'we have an exciting offers  nears',
    ),
    NotificationModel(
      title: 'patient',
      date: '09:10 Am',
      img: 'assets/images/delivery-man.png',
      body: 'we have an exciting offers for you nears',
    ),
    NotificationModel(
      title: 'hospital manger',
      date: '05:30 Pm',
      img: 'assets/images/delivery-man.png',
      body: 'we have an exciting offers for you nears',
    ),
    NotificationModel(
      title: 'products offers',
      date: '03:48 Pm',
      img: 'assets/images/delivery-man.png',
      body: 'we have an exciting offers for you nears',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: kMainColor,
        backwardsCompatibility: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: kMainColor,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarColor: Colors.white,
        ),
        elevation: 0,
        title: Row(
          children: [
            // Card(
            //   elevation: 2,
            //   color: Color.fromARGB(255, 196, 72, 63),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(10)),
            //   ),
            //   child:
        Image.asset(
                'assets/images/icons8-notification-96.png',
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            // ),
            SizedBox(
              width: 8,
            ),
            Text(
              'الاشعارات',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Column(children: [
            ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => getNotification(model[index]),
                separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                itemCount: model.length)
          ]),
        ),
      ),
    );
  }
}
