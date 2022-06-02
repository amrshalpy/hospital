import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hms/screens/patient/cubit/cubit.dart';
import 'package:hms/screens/patient/patient_details/patient_details.dart';
import 'package:hms/screens/patient/widgets/%20patient.dart';
import 'package:hms/screens/patient/widgets/compnement.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

Widget getPatients(Patient patient, context, int index) {
  return InkWell(
    onTap: () {
      nextPage(context, PatientDetails());
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(width: .3),
      ),
      height: Provider.of(context).isLiked[index] == true ? 220: 160,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 201, 199, 199),
                        child: Lottie.asset(
                          'assets/images/edit.json',
                          height: 40,
                          width: 40,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 201, 199, 199),
                        child: Lottie.asset(
                          'assets/images/delete.json',
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${patient.name}',
                    style: TextStyle(
                      height: .7,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' ${patient.condition}',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Provider.of(context).changeIsLiked(index);
                          },
                          icon:
                          Provider.of(context).isLiked[index] == false
                                  ? Icon(
                                      Icons.arrow_drop_down,
                                      size: 26,
                                    )
                                  : Icon(
                                      Icons.arrow_drop_up,
                                      size: 26,
                                    ),
                        ),
                        if (Provider.of(context).isLiked[index] == true)
                          Column(
                            children: [
                              Text(
                                "التاريخ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '${patient.date}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 10, 6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/portrait-shocked-brunet-european-man-stares-surprisingly-camera-keeps-eyes-widely-opened-wears-round-spectacles-sweater-sees-something-breathtaking-isolated-beige-studio-background_273609-56718.jpg?w=740',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
