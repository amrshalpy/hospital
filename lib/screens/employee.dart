import 'package:flutter/material.dart';
import 'package:hms/components/background.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/models/employee/employee_provider/employee_provider.dart';
import 'package:hms/models/employee/get_employee.dart';
import 'package:hms/screens/add_new_employee.dart';
import 'package:hms/screens/addbranche.dart';
import 'package:hms/screens/patient/cubit/employee_cubit.dart';
import 'package:hms/screens/patient/cubit/employee_state.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../models/employees.dart';

class Employee extends StatefulWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  _Employeestate createState() => _Employeestate();
}

class _Employeestate extends State<Employee> {
  bool initial = false;
  List<Employees> Employee_list = [];
  bool isPage = false;
  int pages = 10;
  getdata() {
    Employee_list.clear();
    Employee_list.add(Employees(
        name: "احمد خالد محمود ",
        adress: "الاسكندرية",
        phone: "0100000000000",
        dateOfBirth: "12-10-1996",
        dateOfHiring: "10-10-2022"));
    Employee_list.add(Employees(
        name: " محمد علي",
        adress: "الجيزة",
        phone: "0100000000001",
        dateOfBirth: "12-10-1996",
        dateOfHiring: "10-10-2022"));
    Employee_list.add(Employees(
        name: " الهام السيد",
        adress: "الاسكندرية",
        phone: "0100000000002",
        dateOfBirth: "12-10-1996",
        dateOfHiring: "10-10-2022"));
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    var employee = Provider.of<EmployeeProvider>(context);
    return
           Scaffold(
            body:
                 Background(
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
                                        builder: (_) => AddNewEmployee(),
                                      ),
                                    )
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'اضافه موظف/ة جديد',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ), employee.getEmployeeData != null?
                              employee.getEmployeeData!.data!.isNotEmpty
                                  ? ListView.builder(
                                      controller:
                                          employee.controller,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          getEmployee(employee
                                              .getEmployeeData!.data![index]),
                                      itemCount: employee.dataOfPages!.length +=
                                          employee.pages,
                                    )
                                  : Center(child: Text('اضف الموظفين'))
                              :  Center(child: CircularProgressIndicator(
                                color: Colors.grey,
                                strokeWidth: .4,
                              )),
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
                              'الموظفين',
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

  Widget getEmployee(Data data) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(top: 0),
          child: Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 5, left: 5, top: 10),
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                            backgroundColor: Colors.black26,
                                            child: Center(
                                              child: Lottie.asset(
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
                                          child: CircleAvatar(
                                            backgroundColor: Colors.black26,
                                            child: Center(
                                              child: Lottie.asset(
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
                                      '${data.nameAr}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
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
                                      '${data.address}',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  subtitle: Center(
                                    child: Text(
                                        ' جوال  :    ' + '${data.phoneNumber}',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87)),
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  children: [
                                    ListTile(
                                        title: Text(
                                            ' النوع :' + '${data.gender}')),
                                    // ListTile(
                                    //     title: Text(
                                    //         ' مستوى المستشفي :' +
                                    //             Employee_list[
                                    //             index]
                                    //                 .level
                                    //                 .toString())),
                                    // ListTile(
                                    //     title: Text(
                                    //         ' البطاقة الضريبية' +
                                    //             Employee_list[
                                    //             index]
                                    //                 .tax_num
                                    //                 .toString())),
                                    // Center(
                                    //     child: Text(' المدير :' +
                                    //         Employee_list[index]
                                    //             .manger_id
                                    //             .toString())),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              ' تاريخ التشغيل :' +
                                                  '${data.dateExp}',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black38),
                                            ),
                                          ),
                                        ),
                                        // Expanded(
                                        //   child: Align(
                                        //     alignment: Alignment
                                        //         .center,
                                        //     child: Text(
                                        //       ' تاريخ الانشاء :' +
                                        //           Employee_list[
                                        //           index]
                                        //               .create_date
                                        //               .toString(),
                                        //       style: TextStyle(
                                        //           fontSize: 12,
                                        //           fontWeight:
                                        //           FontWeight
                                        //               .normal,
                                        //           color: Colors
                                        //               .black38),
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ]),
                            ]),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
