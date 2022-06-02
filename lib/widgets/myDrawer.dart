import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hms/components/background.dart';
import 'package:hms/screens/AppInfo.dart';
import 'package:hms/screens/attendance.dart';
import 'package:lottie/lottie.dart';

class myDrawer extends StatefulWidget {
  final BuildContext contxt;

  myDrawer({
    required this.contxt,
  });

  @override
  _myDrawerState createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Background(
        child: Container(
          child: Stack(children: <Widget>[
            Container(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .23,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            height: MediaQuery.of(context).size.height * .23,
                            child:  Lottie.asset(
                                'assets/images/doctors.json'),

                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).popAndPushNamed(HomeScreen.id);
                    },
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(right: 10.0,left: 10),
                        child: Text(
                          'الرئيسية',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.home, color: Colors.black45),
                      ),
                      dense: true,
                      contentPadding: EdgeInsets.all(5),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => attendance(title: "حضور وانصراف الموظفين"),
                        ),
                      );
                    },
                    child: ListTile(
                      title:  Padding(
                        padding: const EdgeInsets.only(right: 10.0,left: 10),
                        child: Text(
                          'حضور وانصراف الموظفين',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.calendar_today, color: Colors.black45),
                      ),
                      dense: true,
                      contentPadding: EdgeInsets.all(5),
                    ),
                  ),    GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AppInfo(),
                        ),
                      );
                    },
                    child: ListTile(
                      title:  Padding(
                        padding: const EdgeInsets.only(right: 10.0,left: 10),
                        child: Text(
                          'عن التطبيق',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.info_outline, color: Colors.black45),
                      ),
                      dense: true,
                      contentPadding: EdgeInsets.all(5),
                    ),
                  ),

                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height-40,
              left: 0.0,
              right: 0.0,
              child:Center(child: Text('Copyright©2022  El-Raeda',style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.black87),)),
            ),
          ]),
        ),
      ),
    );
  }
}
