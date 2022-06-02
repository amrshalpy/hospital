import 'package:flutter/material.dart';
import 'package:hms/components/background.dart';
import 'package:hms/models/department.dart';
import 'package:lottie/lottie.dart';

import '../constants/constants.dart';
import 'add_department.dart';
class AddDepartment extends StatefulWidget {
  const AddDepartment({Key? key}) : super(key: key);

  @override
  _AddDepartmentState createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  bool initial = false;
  List<Department> department_list = [];
  getData(){
    department_list.clear();
    department_list.add(new Department(
      branch_id:  "مستشفى زمزم",
      name:  " الأمراض العصبية والنفسية",
      department_num: "5689",
      lvl_id:  "الأول",
      suite_id: "C",
      department_manager_id: "د محمد أحمد",
          ));
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Background(
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(color: Colors.white),
                            backgroundColor: kMainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Adddepartment(),
                              ),
                            )

                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                          label: Text(
                            'اضافه قسم جديد',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(top: 0),
                              child: Stack(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          right: 5, left: 5, top: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black38),
                                        color: Colors.white.withAlpha(220),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 35.0,
                                                              width: 35.0,
                                                              child: CircleAvatar(
                                                                backgroundColor:
                                                                Colors.black26,
                                                                child: Center(
                                                                  child:  Lottie.asset(
                                                                      'assets/images/delete.json'),

                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            SizedBox(
                                                              height: 35.0,
                                                              width: 35.0,
                                                              child:CircleAvatar(
                                                                backgroundColor:
                                                                Colors.black26,
                                                                child: Center(
                                                                  child:  Lottie.asset(
                                                                      'assets/images/edit.json'),

                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Center(
                                                            child: Text(
                                                              department_list[index]
                                                                  .name
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  ExpansionTile(
                                                      initiallyExpanded: initial,
                                                      onExpansionChanged: (bool) {
                                                        setState(() {
                                                          initial = bool;
                                                        });
                                                      },
                                                      title: Center(
                                                        child: Text(
                                                          department_list[index]
                                                              .branch_id
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                              FontWeight.normal,
                                                              color:
                                                              Colors.black87),
                                                        ),
                                                      ),
                                                      subtitle: Center(
                                                        child: Text(
                                                            ' رقم القسم  :    ' +
                                                                department_list[index]
                                                                    .department_num
                                                                    .toString(),
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                                color: Colors
                                                                    .black87)),
                                                      ),
                                                      controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                      children: [
                                                        ListTile(
                                                            title: Text(' الدور :' +
                                                                department_list[index]
                                                                    .lvl_id
                                                                    .toString())),
                                                        ListTile(
                                                            title: Text(
                                                                ' رقم القسم :' +
                                                                    department_list[
                                                                    index]
                                                                        .department_num
                                                                        .toString())),
                                                        ListTile(
                                                            title: Text(
                                                                ' الجناح' +
                                                                    department_list[
                                                                    index]
                                                                        .suite_id
                                                                        .toString())),
                                                        Center(
                                                            child: Text(' رئيس القسم :' +
                                                                department_list[index]
                                                                    .department_manager_id
                                                                    .toString())),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        // Row(
                                                        //   children: [
                                                        //     Expanded(
                                                        //       child: Align(
                                                        //         alignment: Alignment
                                                        //             .center,
                                                        //         child: Text(
                                                        //           ' مدير القسم :' +
                                                        //               department_list[
                                                        //               index]
                                                        //                   .department_manager_id
                                                        //                   .toString(),
                                                        //           style: TextStyle(
                                                        //               fontSize: 12,
                                                        //               fontWeight:
                                                        //               FontWeight
                                                        //                   .normal,
                                                        //               color: Colors
                                                        //                   .black38),
                                                        //         ),
                                                        //       ),
                                                        //     ),
                                                        //
                                                        //   ],
                                                        // ),
                                                      ]),
                                                ]),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        itemCount: department_list.length,
                      ),
                    ],
                  ),
                  top: 110.0,
                  left: 0.0,
                  right: 0.0,
                ),
                new Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: AppBar(
                    title: Text(
                      'الاقسام',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    centerTitle: true,
                    actions: [
                      SizedBox(
                        width: 10,
                      ),
                    ],
                    leading: new IconButton(
                      icon: new Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 28,
                      ),
                      onPressed: () => {
                        Navigator.of(context).pop(),
                      },
                    ),
                    // You can add title here
                    backgroundColor: Colors.blue.withOpacity(0.0),
                    //You can make this transparent
                    elevation: 0.0, //No shadow
                  ),
                ),
              ],
            ),
          )),
      backgroundColor: Colors.white,
    );
  }
}