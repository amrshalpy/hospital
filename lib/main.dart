import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hms/constants/api_key.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/models/employee/employee_provider/employee_provider.dart';
import 'package:hms/screens/admin_login/admon_provider/admin_provider.dart';
import 'package:hms/screens/branches.dart';
import 'package:hms/screens/branchs/provider/branch_provider.dart';
import 'package:hms/screens/doctors/doctor_provider/doctor_provider.dart';
import 'package:hms/screens/home.dart';
import 'package:hms/screens/intro_slider.dart';
import 'package:hms/screens/admin_login/login_screen.dart';
import 'package:hms/screens/patient/cubit/cubit.dart';
import 'package:hms/screens/patient/cubit/employee_cubit.dart';
import 'package:hms/screens/patient/widgets/provider/arrow_provider.dart';
import 'package:hms/screens/profile_screen.dart';
import 'package:hms/screens/splash_screen.dart';
import 'package:hms/share/network/dio_helper.dart';
import 'package:hms/share/remote/cache_helper.dart';
// import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
// import 'package:table_calendar/table_calendar.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  // initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  uid = CacheHelper.getData(key: ktokenApi);
  // print(uid);
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BranchProvider>(
          create: (context) => BranchProvider()
            ..fetchData()
            ..getBranchData(),
        ),
        ChangeNotifierProvider<DoctorProvider>(
          create: (context) => DoctorProvider()
            ..getDoctors()
            ..fetchData(),
        ),
        ChangeNotifierProvider<AdminProvider>(
            create: (context) => AdminProvider()),
        ChangeNotifierProvider<ArrowProvider>(
            create: (context) => ArrowProvider()),
        ChangeNotifierProvider<EmployeeProvider>(
          create: (context) => EmployeeProvider()
            ..getEmployee()
            ..fetchData(),
        ),
      ],
      child: MaterialApp(
        title: 'HMS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',
        ),
        home: SplashScreen(),
      ),
    );
  }
}
