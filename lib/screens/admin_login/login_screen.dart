import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hms/constants/api_key.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/screens/admin_login/admon_provider/admin_provider.dart';
import 'package:hms/screens/home.dart';
import 'package:hms/components/background.dart';
import 'package:hms/screens/patient/cubit/cubit.dart';
import 'package:hms/screens/patient/cubit/state.dart';
import 'package:hms/share/remote/cache_helper.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
      var admin = Provider.of<AdminProvider>(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Background(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40.0,
                    ),
                    Container(
                        width: 300,
                        height: 300,
                        child: Lottie.asset('assets/images/login2.json')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "تسجيل دخول",
                      style: TextStyle(
                          fontSize: 25,
                          color: kMainColor,
                          fontWeight: FontWeight.bold),
                    ),
                    inputItem('الاسم', nameController),
                    inputItem('كلمة المرور ', passwordController,
                        isPassword: true),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            admin.loginAdminData(
                                nameController.text, passwordController.text);
                            if(admin.isPage){
                              Fluttertoast.showToast(
                                            msg: " الاسم او الباسورد غير صحيح ",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                            }else{
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: admin.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  )
                                : const Text(
                                    'تسجيل الدخول  ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kMainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            fixedSize: const Size(0, 45),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ),


    );
  }

  Widget inputItem(String text, TextEditingController txtControl,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(text),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: txtControl,
              decoration: InputDecoration(
                suffixIcon: isPassword
                    ? InkWell(
                        onTap: () {},
                        child: const Icon(Icons.visibility),
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(72, 175, 218, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
