import 'package:flutter/material.dart';
import 'package:hms/components/background.dart';
import 'package:hms/components/backgroundbottom.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/screens/profile_screen.dart';
import 'package:hms/widgets/profile_pic.dart';

class EditUserData extends StatefulWidget {
  const EditUserData({Key? key}) : super(key: key);

  @override
  _EditUserDataState createState() => _EditUserDataState();
}

class _EditUserDataState extends State<EditUserData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('بيانات المستخدم'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kMainColor,
      ),
      body: Backgroundbottom(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            ProfilePic(),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Container(
                width: 349,
                height: 60.0,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'اسم المستخدم ',
                    suffixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
            ),
            Container(
              width: 349,
              height: 60.0,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.lock),
                  hintText: 'كلمة المرور ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Container(
                width: 349,
                height: 60.0,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.perm_identity),
                    hintText: 'الوظيفة',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: 349,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProfileScreen(),
                    ),
                  );
                },
                child: Text(
                  'حفظ البيانات',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: kMainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  fixedSize: Size(0, 45),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
