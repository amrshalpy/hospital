import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actionsIconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          'تفاصيل المريض',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,
        color: Colors.black,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 15, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          const Center(
            child: CircleAvatar(
              maxRadius: 60,
              backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'علي احمد',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                ' :  اسم المريض',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
