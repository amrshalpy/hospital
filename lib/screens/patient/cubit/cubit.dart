// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hms/constants/admin_const.dart';
// import 'package:hms/constants/api_key.dart';
// import 'package:hms/models/admin/admin_model.dart';
// import 'package:hms/models/branch/get_branch.dart';
// import 'package:hms/models/branch/widgets/create_branches.dart';
// import 'package:hms/models/doctors/add_doctors.dart';
// import 'package:hms/models/doctors/delete_doctor.dart';
// import 'package:hms/models/doctors/doctor_details.dart';
// import 'package:hms/models/doctors/doctor_details.dart';
// import 'package:hms/models/doctors/get_doctor.dart';
// import 'package:hms/models/doctors/update_doctor.dart';
// import 'package:hms/screens/patient/cubit/state.dart';
// import 'package:hms/share/network/dio_helper.dart';
//
// class PatientCubit extends Cubit<PatientState> {
//   PatientCubit() : super(PatientInitailState());
//   static PatientCubit get(context) => BlocProvider.of(context);
//   Map<int, bool> isLiked = {};
//   void changeIsLiked(int index) {
//     isLiked[index] = !(isLiked[index] ?? false);
//     emit(ChangeLiked());
//   }
//
//   AdminModel? adminModel;
//   void loginAdminData(String email, password) {
//     emit(LoginAdminDataLoading());
//     try {
//       DioHelper.postData(
//         data: {
//           'UserName': email,
//           'Password': password,
//         },
//         path: kLogin,
//       ).then((value) {
//         adminModel = AdminModel.fromJson(value.data);
//         print(adminModel!.data!.username);
//         emit(LoginAdminDataSucsses(adminModel!.data!.token));
//       }).catchError((er) {
//         emit(LoginAdminDataError());
//
//         print(er.toString());
//       });
//     } catch (er) {
//       print(er.toString());
//     }
//   }
//   GetBranches? getBranchModel;
//
//   int currentPage = 1;
//   ScrollController controller = ScrollController();
//   int pages = 2;
//   List? dataOfPages;
//
//   void inCreasePage() {
//     dataOfPages = List.generate(2, (index) => index);
//     emit(IncreasePage());
//     getBranches();
//     print(currentPage);
//   }
//
//   void fetchData() {
//     dataOfPages = List.generate(2, (index) => index);
//
//     controller.addListener(() {
//       if (controller.position.pixels == controller.position.maxScrollExtent) {
//         inCreasePage();
//
//         emit(FetchData());
//       }
//     });
//   }
//
//   void getBranches() {
//     emit(GetBranchesLoading());
//
//     DioHelper.getData(
//             token: uid!,
//             path:
//                 'https://192.168.1.100:49/api/Branch/Get?pageId= $currentPage')
//         .then((value) {
//       getBranchModel = GetBranches.fromJson(value.data);
//       print(currentPage);
//       emit(GetBranchesSucsses());
//     }).catchError((er) {
//       print(er.toString());
//     });
//   }
//
//   void updateBranch({int? id}) {
//     emit(UpdateBranchesLoading());
//
//     DioHelper.patchData(
//       path: kUpdateBranch,
//       data: {
//         'id': id,
//       },
//       token: uid!,
//     ).then((value) {
//       emit(UpdateBranchesSucsses());
//
//       getBranches();
//     }).catchError((er) {
//       print(er.toString());
//     });
//   }
//
//   void deleteBranch({id}) {
//     emit(DeleteBranchesLoading());
//
//     DioHelper.deleteData(
//       path: kdeleteBranch,
//       data: {'id': id},
//     ).then((value) {
//       emit(DeleteBranchesSucsses());
//
//       getBranches();
//     }).catchError((er) {
//       emit(DeleteBranchesError());
//
//       print(er.toString());
//     });
//   }
//
//   CreateBranche? createBranchModel;
//   void createBranch({
//     String? nameAr,
//     String? nameEn,
//     int? branchId,
//     int? companyId,
//     String? note,
//     String? address,
//     String? mangerMobile,
//     String? mangerName,
//     String? taxNumber,
//     String? commercialNumber,
//   }) {
//     emit(CreateBranchesLoading());
//     try {
//       DioHelper.postData(
//         token: uid!,
//         data: {
//           'NameAr': nameAr,
//           'NameEn': nameEn,
//           'BranchId': branchId,
//           'CompanyId': companyId,
//           'Note': note,
//           'Address': address,
//           'MangerMobile': mangerMobile,
//           'MangerName': mangerName,
//           'TaxNumber': taxNumber,
//           'CommercialNumber': commercialNumber,
//         },
//         path: kCreateBranch,
//       ).then((value) {
//         createBranchModel = CreateBranche.fromJson(value.data);
//         emit(CreateBranchesSucsses());
//       }).catchError((er) {
//         emit(CreateBranchesError());
//
//         print(er.toString());
//       });
//     } catch (er) {
//       print(er.toString());
//     }
//   }
//
//   void getBranchesDetails() {
//     emit(GetBranchsDetailsLoading());
//     DioHelper.getData(path: kGetDetailsBranch, token: uid).then((value) {
//       emit(GetBranchsDetailsSucsses());
//     }).catchError((er) {
//       print(er);
//       emit(GetBranchsDetailsError());
//     });
//   }
//
//   AddDoctor? addDoctor;
//   void createNewDoctor({
//     String? nameAr,
//     String? nameEn,
//     int? branchId,
//     int? empNo,
//     String? job,
//     String? note,
//     int? companyId,
//     String? birthDate,
//     String? email,
//     String? address,
//     String? gender,
//     String? phoneNumber,
//     String? phoneNumberSecond,
//     String? socialStatus,
//     String? numberIdentification,
//     String? datePermanent,
//     String? dateExp,
//     String? dateAppointment,
//     String? typeIdentification,
//     String? exprience,
//     String? specialiation,
//     String? cerficationDate,
//     dynamic sallery,
//     int? remeningDay,
//     String? statusProccess,
//     String? nationalityTitel,
//     int? nationalityId,
//     String? scientificDisciplinesTitel,
//     int? scientificDisciplinesId,
//     String? userName,
//     String? password,
//     String? confirmPassword,
//     int? role,
//   }) {
//     emit(CreateNewDoctorLoading());
//     DioHelper.postData(
//         token: uid,
//         path: 'https://192.168.1.100:49/api/Employee/Creat',
//         data: {
//           'NameAr': nameAr,
//           'Role': role,
//           'Password': password,
//           'ConfirmPassword': confirmPassword,
//           'UserName': userName,
//           'ScientificDisciplinesId': scientificDisciplinesId,
//           'ScientificDisciplinesTitel': scientificDisciplinesTitel,
//           'NationalityId': nationalityId,
//           'NationalityTitel': nationalityTitel,
//           'RemeningDay': remeningDay,
//           'Sallery': sallery,
//           'StatusProccess': statusProccess,
//           'CerficationDate': cerficationDate,
//           'Specialiation': specialiation,
//           'Exprience': exprience,
//           'DateAppointment': dateAppointment,
//           'TypeIdentification': typeIdentification,
//           'DateExp': dateExp,
//           'DatePermanent': datePermanent,
//           'NumberIdentification': numberIdentification,
//           'PhoneNumberSecond': phoneNumberSecond,
//           'SocialStatus': socialStatus,
//           'Gender': gender,
//           'PhoneNumber': phoneNumber,
//           'Job': job,
//           'BirthDate': birthDate,
//           'Email': email,
//           'NameEn': nameEn,
//           'BranchId': branchId,
//           'CompanyId': companyId,
//           'Note': note,
//           'EmpNo': empNo,
//         }).then((value) {
//       addDoctor = AddDoctor.fromJson(value.data);
//       emit(CreateNewDoctorSucsses());
//     }).catchError((er) {
//       emit(CreateNewDoctorError());
//
//       print(er.toString());
//     });
//   }
//
//   DeleteDoctor? deleteDoctor;
//   void deleteDoctorData({id}) {
//     emit(CreateNewDoctorLoading());
//
//     DioHelper.deleteData(path: kDeleteDoctor, token: uid, data: {'id': id})
//         .then((value) {
//       deleteDoctor = DeleteDoctor.fromJson(value.data);
//       emit(CreateNewDoctorSucsses());
//     }).catchError((er) {
//       emit(CreateNewDoctorSucsses());
//
//       print(er.toString());
//     });
//   }
//
//   GetDector? getDector;
//   void getDoctor() {
//     emit(GetDoctorLoading());
//
//     DioHelper.getData(
//       path: 'https://192.168.1.100:49/api/Employee/Get?pageId=1',
//       token: uid!,
//     ).then((value) {
//       getDector = GetDector.fromJson(value.data);
//       emit(GetDoctorSucsses());
//     }).catchError((er) {
//       emit(GetDoctorError());
//
//       print(er.toString());
//     });
//   }
//
//   UpdateDoctor? updateDoctorData;
//   void updateDoctor({
//     String? nameAr,
//     String? nameEn,
//     int? branchId,
//     int? empNo,
//     String? job,
//     String? note,
//     int? companyId,
//     String? birthDate,
//     String? email,
//     String? address,
//     String? gender,
//     String? phoneNumber,
//     String? phoneNumberSecond,
//     String? socialStatus,
//     String? numberIdentification,
//     String? datePermanent,
//     String? dateExp,
//     String? dateAppointment,
//     String? typeIdentification,
//     String? exprience,
//     String? specialiation,
//     String? cerficationDate,
//     dynamic sallery,
//     int? remeningDay,
//     String? statusProccess,
//     String? nationalityTitel,
//     int? nationalityId,
//     String? scientificDisciplinesTitel,
//     int? scientificDisciplinesId,
//     String? userName,
//     String? password,
//     String? confirmPassword,
//     int? role,
//   }) {
//     emit(UpdateDoctorDetailsLoading());
//     DioHelper.patchData(
//       path: kUpdateDoctor,
//       token: uid,
//       data: {
//         'NameAr': nameAr,
//         'Role': role,
//         'Password': password,
//         'ConfirmPassword': confirmPassword,
//         'UserName': userName,
//         'ScientificDisciplinesId': scientificDisciplinesId,
//         'ScientificDisciplinesTitel': scientificDisciplinesTitel,
//         'NationalityId': nationalityId,
//         'NationalityTitel': nationalityTitel,
//         'RemeningDay': remeningDay,
//         'Sallery': sallery,
//         'StatusProccess': statusProccess,
//         'CerficationDate': cerficationDate,
//         'Specialiation': specialiation,
//         'Exprience': exprience,
//         'DateAppointment': dateAppointment,
//         'TypeIdentification': typeIdentification,
//         'DateExp': dateExp,
//         'DatePermanent': datePermanent,
//         'NumberIdentification': numberIdentification,
//         'PhoneNumberSecond': phoneNumberSecond,
//         'SocialStatus': socialStatus,
//         'Gender': gender,
//         'PhoneNumber': phoneNumber,
//         'Job': job,
//         'BirthDate': birthDate,
//         'Email': email,
//         'NameEn': nameEn,
//         'BranchId': branchId,
//         'CompanyId': companyId,
//         'Note': note,
//         'EmpNo': empNo,
//       },
//     ).then((value) {
//       updateDoctorData = UpdateDoctor.fromJson(value.data);
//       emit(UpdateDoctorDetailsSucsses());
//     }).catchError((er) {
//       emit(UpdateDoctorDetailsError());
//
//       print(er.toString());
//     });
//   }
//
//   DoctorDetails? doctorDetails;
//   void getDetailsDoctorData({id}) {
//     emit(GetDoctorDetailsLoading());
//     DioHelper.getData(
//       path: 'https://192.168.1.100:49/api/Employee/Details ? id = 7',
//       token: uid,
//     ).then((value) {
//       doctorDetails = DoctorDetails.fromJson(value.data);
//       emit(GetDoctorDetailsSucsses());
//     }).catchError((er) {
//       emit(GetDoctorDetailsError());
//
//       print(er.toString());
//     });
//   }
// }
