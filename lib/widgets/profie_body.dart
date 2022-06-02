import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hms/components/backgroundbottom.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/screens/notifications/notifications.dart';
import 'package:hms/widgets/edit_username_data.dart';
import 'package:hms/widgets/profile_pic.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Backgroundbottom(
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          ProfilePic(),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: FlatButton(
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: kMainColor,
              onPressed: () {},
              child: GestureDetector(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Text(
                        'حسابي الشخصي',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditUserData(),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: FlatButton(
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: kMainColor,
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationScreen()));
                      },
                      child: Text(
                        'الاشعارات',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: FlatButton(
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: kMainColor,
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Text(
                      'الاعدادات',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: FlatButton(
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: kMainColor,
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
