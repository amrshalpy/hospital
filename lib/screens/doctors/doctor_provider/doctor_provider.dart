import 'package:flutter/cupertino.dart';
import 'package:hms/constants/admin_const.dart';
import 'package:hms/constants/api_key.dart';
import 'package:hms/models/doctors/add_doctors.dart';
import 'package:hms/models/doctors/delete_doctor.dart';
import 'package:hms/models/doctors/doctor_details.dart';
import 'package:hms/models/doctors/get_doctor.dart';
import 'package:hms/models/doctors/update_doctor.dart';
import 'package:hms/share/network/dio_helper.dart';

class DoctorProvider with ChangeNotifier {
  bool isLoading = false;
  bool isPage = false;
  AddDoctor? addDoctor;
  void createNewDoctor({
    String? nameAr,
    String? nameEn,
    int? branchId,
    int? empNo,
    String? job,
    String? note,
    int? companyId,
    String? birthDate,
    String? email,
    String? address,
    String? gender,
    String? phoneNumber,
    String? phoneNumberSecond,
    String? socialStatus,
    String? numberIdentification,
    String? datePermanent,
    String? dateExp,
    String? dateAppointment,
    String? typeIdentification,
    String? exprience,
    String? specialiation,
    String? cerficationDate,
    dynamic sallery,
    int? remeningDay,
    String? statusProccess,
    String? nationalityTitel,
    int? nationalityId,
    String? scientificDisciplinesTitel,
    int? scientificDisciplinesId,
    String? userName,
    String? password,
    String? confirmPassword,
    int? role,
  }) {
    isLoading = true;
    isPage = false;
    DioHelper.postData(path: kCreateDoctor, token: uid, data: {
      'NameAr': nameAr,
      'Role': role,
      'Password': password,
      'ConfirmPassword': confirmPassword,
      'UserName': userName,
      'ScientificDisciplinesId': scientificDisciplinesId,
      'ScientificDisciplinesTitel': scientificDisciplinesTitel,
      'NationalityId': nationalityId,
      'NationalityTitel': nationalityTitel,
      'RemeningDay': remeningDay,
      'Sallery': sallery,
      'StatusProccess': statusProccess,
      'CerficationDate': cerficationDate,
      'Specialiation': specialiation,
      'Exprience': exprience,
      'DateAppointment': dateAppointment,
      'TypeIdentification': typeIdentification,
      'DateExp': dateExp,
      'DatePermanent': datePermanent,
      'NumberIdentification': numberIdentification,
      'PhoneNumberSecond': phoneNumberSecond,
      'SocialStatus': socialStatus,
      'Gender': gender,
      'PhoneNumber': phoneNumber,
      'Job': job,
      'BirthDate': birthDate,
      'Email': email,
      'NameEn': nameEn,
      'BranchId': branchId,
      'CompanyId': companyId,
      'Note': note,
      'EmpNo': empNo,
    }).then((value) {
      addDoctor = AddDoctor.fromJson(value.data);
    }).catchError((er) {
      print(er.toString());
    }).onError((error, stackTrace) {
      isLoading = false;
      isPage = false;
    }).catchError((er) {
      print(er.toString());
    }).whenComplete(() {
      isLoading = false;
      isPage = true;
    });

    notifyListeners();
  }

  int currentPage = 1;
  ScrollController controller = ScrollController();
  int pages = 2;
  List? dataOfPages;

  void inCreasePage() {
    dataOfPages = List.generate(2, (index) => index);
    getDoctors();
    print(currentPage);
    notifyListeners();
  }

  void fetchData() {
    dataOfPages = List.generate(2, (index) => index);

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        inCreasePage();

        notifyListeners();
      }
    });
  }

  GetDector? getDector;
  void getDoctors() {
    isPage = false;
    isLoading = true;
    DioHelper.getData(
      path: 'https://192.168.1.100:49/api/Employee/Get?pageId= $currentPage',
      token: uid,
    ).then((value) {
      getDector = GetDector.fromJson(value.data);
    }).catchError((er) {
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

  DeleteDoctor? deleteDoctor;
  void deleteDoctorData({id}) {
    isPage = false;
    isLoading = true;

    DioHelper.deleteData(path: kDeleteDoctor, token: uid, data: {'id': id})
        .then((value) {
      deleteDoctor = DeleteDoctor.fromJson(value.data);
    }).catchError((er) {
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

  UpdateDoctor? updateDoctorData;
  void updateDoctor({
    String? nameAr,
    String? nameEn,
    int? branchId,
    int? empNo,
    String? job,
    String? note,
    int? companyId,
    String? birthDate,
    String? email,
    String? address,
    String? gender,
    String? phoneNumber,
    String? phoneNumberSecond,
    String? socialStatus,
    String? numberIdentification,
    String? datePermanent,
    String? dateExp,
    String? dateAppointment,
    String? typeIdentification,
    String? exprience,
    String? specialiation,
    String? cerficationDate,
    dynamic sallery,
    int? remeningDay,
    String? statusProccess,
    String? nationalityTitel,
    int? nationalityId,
    String? scientificDisciplinesTitel,
    int? scientificDisciplinesId,
    String? userName,
    String? password,
    String? confirmPassword,
    int? role,
  }) {
    isPage = false;
    isLoading = true;

    DioHelper.patchData(
      path: kUpdateDoctor,
      token: uid,
      data: {
        'NameAr': nameAr,
        'Role': role,
        'Password': password,
        'ConfirmPassword': confirmPassword,
        'UserName': userName,
        'ScientificDisciplinesId': scientificDisciplinesId,
        'ScientificDisciplinesTitel': scientificDisciplinesTitel,
        'NationalityId': nationalityId,
        'NationalityTitel': nationalityTitel,
        'RemeningDay': remeningDay,
        'Sallery': sallery,
        'StatusProccess': statusProccess,
        'CerficationDate': cerficationDate,
        'Specialiation': specialiation,
        'Exprience': exprience,
        'DateAppointment': dateAppointment,
        'TypeIdentification': typeIdentification,
        'DateExp': dateExp,
        'DatePermanent': datePermanent,
        'NumberIdentification': numberIdentification,
        'PhoneNumberSecond': phoneNumberSecond,
        'SocialStatus': socialStatus,
        'Gender': gender,
        'PhoneNumber': phoneNumber,
        'Job': job,
        'BirthDate': birthDate,
        'Email': email,
        'NameEn': nameEn,
        'BranchId': branchId,
        'CompanyId': companyId,
        'Note': note,
        'EmpNo': empNo,
      },
    ).then((value) {
      updateDoctorData = UpdateDoctor.fromJson(value.data);
    }).catchError((er) {
      print(er.toString());
    }).whenComplete(() {
      isPage = true;
      isLoading = false;
    }).onError((error, stackTrace) {
      isPage = false;
      isLoading = false;
    });
    notifyListeners();
  }

  DoctorDetails? doctorDetails;
  void getDetailsDoctorData({id}) {
    isPage = false;
    isLoading = false;

    DioHelper.getData(
      path: 'https://192.168.1.100:49/api/Employee/Details ? id = 7',
      token: uid,
    ).then((value) {
      doctorDetails = DoctorDetails.fromJson(value.data);
    }).catchError((er) {
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
