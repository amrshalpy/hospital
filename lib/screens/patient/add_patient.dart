import 'package:flutter/material.dart';
import 'package:hms/components/background.dart';
import 'package:hms/components/backgroundbottom.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/screens/patient/widgets/compnement.dart';

class AddPatient extends StatelessWidget {
  AddPatient({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var conditionController = TextEditingController();
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "اضافه المرضي",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Backgroundbottom(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          child: Column(children: [
            buildFormField(
                controller: nameController,
                hint: "اسم المريض",
                label: "اسم المريض",
                type: TextInputType.name,
                icon: Icons.person),
            SizedBox(
              height: 10,
            ),
            buildFormField(
                controller: conditionController,
                hint: "رقم المريض",
                label: "رقم المريض",
                type: TextInputType.name,
                icon: Icons.person),
            SizedBox(
              height: 10,
            ),
            buildFormField(
                controller: dateController,
                hint: "اليوم",
                label: "اليوم",
                type: TextInputType.datetime,
                icon: Icons.date_range),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: kMainColor),
              onPressed: () {},
              child: Text(
                "اضافه المريض",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
