import 'package:flutter/material.dart';
import 'package:hms/constants/admin_const.dart';
import 'package:hms/constants/api_key.dart';
import 'package:hms/models/branch/get_branch.dart';
import 'package:hms/models/branch/widgets/create_branches.dart';
import 'package:hms/share/network/dio_helper.dart';

class BranchProvider with ChangeNotifier {
  CreateBranche? createBranche;
  bool isLoading = false;
  bool isPage = false;

  createBranchData({
    String? nameAr,
    String? nameEn,
    int? branchId,
    int? companyId,
    String? note,
    String? address,
    String? mangerMobile,
    String? mangerName,
    String? taxNumber,
    String? commercialNumber,
  }) {
    isLoading = true;
    DioHelper.postData(
      path: 'https://192.168.1.100:49/api/Branch/Create',
      token: uid,
      data: {
        'NameAr': nameAr,
        'NameEn': nameEn,
        'BranchId': branchId,
        'CompanyId': companyId,
        'Note': note,
        'Address': address,
        'MangerMobile': mangerMobile,
        'MangerName': mangerName,
        'TaxNumber': taxNumber,
        'CommercialNumber': commercialNumber,
      },
    ).then((value) {
      createBranche = CreateBranche.fromJson(value.data);
      isLoading = false;
    }).catchError((er) {
      print(er.toString());
    }).onError((error, stackTrace) {
      isLoading = false;
      isPage = false;

      print('failed');
    }).whenComplete(() {
      isPage = true;

      print('complet');
      isLoading = false;
    });
    notifyListeners();
  }

  int currentPage = 1;
  GetBranches? getBranches;
  ScrollController controller = ScrollController();
  int pages = 4;
  List? dataOfPages;


  void fetchData() {
    dataOfPages = List.generate(2, (index) => index);

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        getBranchData();
      }
    });
    notifyListeners();
  }

  Future<void> getBranchData() async {
    isLoading = true;

    DioHelper.getData(
      path: 'https://192.168.1.100:49/api/Branch/Get?pageId=1',
      token: uid,
    ).then((value) {
      getBranches = GetBranches.fromJson(value.data);
    }).catchError((er) {
      print(er.toString());
      // })
      //     .onError((error, stackTrace) {
      //   isLoading = false;
      // }).whenComplete(() {
      //   print('complete branch');
    });
    notifyListeners();
  }

  void deleteBranch({id}) {
    isLoading = true;
    isPage = false;

    DioHelper.deleteData(path: kdeleteBranch, token: uid!, data: {'id': id})
        .then((value) {

    })
        .catchError((er) {
      print(er.toString());
    }).onError((error, stackTrace) async {
      isLoading = false;
      isPage = false;
    }).whenComplete(() {
      isLoading = false;
      isPage = true;
    });
    notifyListeners();
  }

  void updataBranch(id) {
    isPage = false;
    isLoading = true;

    DioHelper.patchData(
      token: uid,
      path: kUpdateBranch,
      data: {
        'id': id,
      },
    ).then((value) {}).catchError((er) {
      print(er.toString());
    }).onError((error, stackTrace) {
      isPage = false;
      isLoading = false;
    }).whenComplete(() {
      isPage = true;
      isLoading = false;
    });
    notifyListeners();
  }
}
