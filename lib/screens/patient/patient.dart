import 'package:flutter/material.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/screens/appointments.dart';
import 'package:hms/screens/patient/add_patient.dart';
import 'package:hms/screens/patient/cubit/cubit.dart';
import 'package:hms/screens/patient/cubit/state.dart';
import 'package:hms/screens/patient/widgets/%20patient.dart';
import 'package:hms/screens/patient/widgets/compnement.dart';
import 'package:hms/screens/patient/widgets/get_patient.dart';
import 'package:provider/provider.dart';

class PatientCondition extends StatefulWidget {
  PatientCondition({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  _PatientConditionState createState() => _PatientConditionState();
}

class _PatientConditionState extends State<PatientCondition> {
  List<Patient> patient = [
    Patient(
        date: '06/11/2002',
        id: 1,
        image: 'assets/images/t4.jpg',
        name: 'amr mohamed',
        condition: 'a headache'),
    Patient(
        date: '09/2/2025',
        id: 2,
        image: 'assets/images/t4.jpg',
        name: 'mostafa ahmmed',
        condition: 'a headache'),
    Patient(
        date: '7/9/2022',
        id: 3,
        image: 'assets/images/t4.jpg',
        name: 'joury ahmmed',
        condition: 'a headache'),
    Patient(
      date: '09/08/2022',
      condition: 'a headache',
      id: 4,
      image: 'assets/images/t4.jpg',
      name: 'abdalla ahmmed',
    ),
    Patient(
      date: '10/11/2022',
      id: 5,
      image: 'assets/images/t4.jpg',
      name: 'amal mostafa',
      condition: 'a headache',
    ),
    Patient(
      date: '30/12/2022',
      id: 6,
      image: 'assets/images/t4.jpg',
      name: 'yasser ali',
      condition: 'a headache',
    ),
    Patient(
      date: '31/11/2022',
      id: 7,
      image: 'assets/images/t4.jpg',
      name: 'ali ahmmed',
      condition: 'a headache',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: kMainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                nextPage(context, AddPatient());
              },
              child: Container(
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: kMainColor),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        maxRadius: 12,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.add, color: kMainColor),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "اضافه المريض",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  getPatients(patient[index], context, index),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: patient.length,
            ),
          ]),
        ),
      ),
    );
  }
}
