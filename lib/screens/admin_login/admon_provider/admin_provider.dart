import 'package:flutter/cupertino.dart';
import 'package:hms/constants/admin_const.dart';
import 'package:hms/constants/api_key.dart';
import 'package:hms/models/admin/admin_model.dart';
import 'package:hms/share/network/dio_helper.dart';
import 'package:hms/share/remote/cache_helper.dart';

class AdminProvider with ChangeNotifier{
  AdminModel? adminModel;
  bool isLoading = false;
  bool isPage = false;
  void loginAdminData(String email, password) {
    try {
      isLoading = true;

      DioHelper.postData(
        data: {
          'UserName': email,
          'Password': password,
        },
        path: kLogin,
      ).then((value) {
        adminModel = AdminModel.fromJson(value.data);
        print(adminModel!.data!.username);
        // emit(LoginAdminDataSucsses(adminModel!.data!.token));
      }).catchError((er) {

        print(er.toString());
      }).onError((error, stackTrace) {
        isLoading = false;
        isPage = false;

      }).whenComplete(() {
        isLoading = false;
        isPage = true;
        CacheHelper.setData(key:ktokenApi , value: adminModel!.data!.token.toString());

      });
    } catch (er) {
      print(er.toString());
    }
    notifyListeners();
  }
}