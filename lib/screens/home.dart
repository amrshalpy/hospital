import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hms/components/background.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/models/HomeModel.dart';
import 'package:hms/screens/appointments.dart';
import 'package:hms/screens/doctors/doctors.dart';
import 'package:hms/screens/patient/patient.dart';
import 'package:hms/screens/department.dart';
import 'package:hms/screens/branches.dart';
import 'package:hms/screens/employee.dart';
import 'package:hms/screens/profile_screen.dart';
import 'package:hms/widgets/myDrawer.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<HomeModel> data = [];
    data.add(HomeModel(
        id: "0",
        name: "الاقسام",
        image: "assets/images/heart.png",
        description: "يمكنك من اضافه الاقسام والتعديل عليها"));
    data.add(HomeModel(
        id: "1",
        name: "الفروع",
        image: "assets/images/branch.png",
        description: "يمكنك من اضافه اكثر من  فروع للمستشفيات "));
    data.add(HomeModel(
        id: "2",
        name: "الاطباء",
        image: "assets/images/logo.png",
        description: "تسجيل بيانات الاطقم الطبية شامل الدكاترة والاطباء"));
    data.add(HomeModel(
        id: "3",
        name: "الموظفين",
        image: 'assets/images/employee.png',
        description: "تسجيل بيانات الموظفين والعاملين بالمستشفي"));
    data.add(HomeModel(
        id: "4",
        name: "المرضي",
        image: "assets/images/patient.png",
        description: "يمكنك من تسجيل المرضي والسجل الطبي الخاص بيهم "));
    data.add(HomeModel(
        id: "5",
        name: "المواعيد والحجوزات",
        image: "assets/images/schedule.png",
        description: "عرض الحجوزات مع حالات الحجز وامكانية تاكيد ورفض الحجز "));
    data.add(HomeModel(
        id: "5",
        name: "الاشعة والتحاليل",
        image: "assets/images/xrays.png",
        description: "عرض بيانات الاشعة والتحاليل لجميع المرضي"));
    ScrollController _scrollController = ScrollController();
    final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white70.withAlpha(230),
      drawer: myDrawer(
        contxt: context,
      ),
      body: Background(
        child: Container(
          child: Column(
            children: [
              AppBar(
                title: const Text(
                  'الرئيسية',
                  style:  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                centerTitle: true,
                actions: [
                  GestureDetector(
                    child: Container(
                      width: 28,
                      child: Lottie.asset('assets/images/user.json'),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfileScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
                leading: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 28,
                  ),
                  onPressed: () => {
                    _globalKey.currentState?.openDrawer(),
                  },
                ),
                // You can add title here
                backgroundColor: Colors.blue.withOpacity(0.0),
                //You can make this transparent
                elevation: 0.0, //No shadow
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: double.infinity,
                            color: Colors.blue,
                            child: const Center(
                                child: Text(
                              "الحجوزات",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Expanded(
                                    child: CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 5.0,
                                  percent: .5,
                                  center: const Text("30%"),
                                  progressColor: Colors.blue,
                                )),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Expanded(
                                    child: Center(
                                  child: Text(
                                    "22",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: double.infinity,
                            color: kMainColor,
                            child: const Center(
                                child: Text(
                              "الاستشارات",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Expanded(
                                    child: CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 5.0,
                                  percent: .2,
                                  center: const Text("18%"),
                                  progressColor: kMainColor,
                                )),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Expanded(
                                    child: Center(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: double.infinity,
                            color: Colors.redAccent,
                            child: const Center(
                                child: Text(
                              "الغاء الحجوزات",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Expanded(
                                    child: CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 5.0,
                                  percent: 0.02,
                                  center: const Text("2%"),
                                  progressColor: Colors.redAccent,
                                )),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Expanded(
                                    child: Center(
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(8.0),
                  mainAxisSpacing: 10,
               childAspectRatio: 1/1.1,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(data.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: 0.0,
                        bottom: 0.0,
                        left: index % 2 == 0 ? 0.0 : 8.0,
                      ),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        color: Colors.white,
                        elevation: 7,
                        shadowColor: Colors.white70,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Container(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    data[index].image,
                                    height: 50,
                                    width: 50,
                                  ),
                                  Center(
                                    child: Text(
                                      data[index].name,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        data[index].description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 11),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 5),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (data[index].id == "1") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => branches(),
                                            ),
                                          );
                                        } else if (data[index].id == "0") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => const AddDepartment(),
                                            ),
                                          );
                                        } else if (data[index].id == "2") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => const doctors(),
                                            ),
                                          );
                                        } else if (data[index].id == "3") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => const Employee(),
                                            ),
                                          );
                                        } else if (data[index].id == "4") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => appointments(
                                                  title: "المواعيد والحجوزات"),
                                            ),
                                          );
                                        } else if (data[index].id == "5") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => PatientCondition(
                                                  title: " المرضي"),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        'عرض التفاصيل ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: kMainColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
