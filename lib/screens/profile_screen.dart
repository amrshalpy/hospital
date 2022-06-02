import 'package:flutter/material.dart';
import 'package:hms/components/background.dart';
import 'package:hms/components/backgroundbottom.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/screens/home.dart';
import 'package:hms/widgets/profie_body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kMainColor,
        centerTitle: true,
        title:  Text('الصفحة الشخصية'),
      ),
      body:  BodyProfile(),
    );
  }
}
