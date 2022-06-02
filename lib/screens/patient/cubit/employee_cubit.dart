// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hms/constants/admin_const.dart';
// import 'package:hms/constants/api_key.dart';
// import 'package:hms/models/employee/add_employee.dart';
// import 'package:hms/models/employee/delete_employee.dart';
// import 'package:hms/models/employee/doctor_employee.dart';
// import 'package:hms/models/employee/doctor_employee.dart';
// import 'package:hms/models/employee/get_employee.dart';
// import 'package:hms/models/employee/update_employee.dart';
// import 'package:hms/screens/patient/cubit/employee_state.dart';
// import 'package:hms/share/network/dio_helper.dart';

// class EmployeeCubit extends Cubit<EmployeeState> {
//   EmployeeCubit() : super(EmployeeInitailState());
//   static EmployeeCubit get(context) => BlocProvider.of(context);

// //pagination
//   ScrollController controller = ScrollController();
//   int pages = 2;
//   List? dataOfPages;

//   void inCreasePage() {
//     dataOfPages = List.generate(2, (index) => index);
//     emit(IncreasePage());
//     getEmployee();
//   }

//   void fetchData() {
//     dataOfPages = List.generate(2, (index) => index);

//     controller.addListener(() {
//       if (controller.position.pixels == controller.position.maxScrollExtent) {
//         inCreasePage();

//         emit(FetchData());
//       }
//     });
//   }

//   AddEmployee? addEmployee;
//   void createNewEmployee({
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
//     emit(CreateNewEmployeeLoading());
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
//       addEmployee = AddEmployee.fromJson(value.data);
//       emit(CreateNewEmployeeSucsses());
//     }).catchError((er) {
//       emit(CreateNewEmployeeError());

//       print(er.toString());
//     });
//   }

//   DeleteEmployee? deleteEmployee;
//   void deleteEmployeeData({id}) {
//     emit(CreateNewEmployeeLoading());

//     DioHelper.deleteData(path: kDeleteDoctor, token: uid, data: {'id': id})
//         .then((value) {
//       deleteEmployee = DeleteEmployee.fromJson(value.data);
//       emit(CreateNewEmployeeSucsses());
//     }).catchError((er) {
//       emit(CreateNewEmployeeSucsses());

//       print(er.toString());
//     });
//   }

//   GetEmployee? getEmployeeData;
//   void getEmployee() {
//     emit(GetEmployeeLoading());

//     DioHelper.getData(
//       path: 'https://192.168.1.100:49/api/Employee/Get?pageId=1',
//       token: uid!,
//     ).then((value) {
//       getEmployeeData = GetEmployee.fromJson(value.data);
//       emit(GetEmployeeSucsses());
//     }).catchError((er) {
//       emit(GetEmployeeError());

//       print(er.toString());
//     });
//   }

//   UpdateEmployee? updateEmployeeData;
//   void updateEmployee({
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
//     emit(UpdateEmployeeDetailsLoading());
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
//       updateEmployeeData = UpdateEmployee.fromJson(value.data);
//       emit(UpdateEmployeeDetailsSucsses());
//     }).catchError((er) {
//       emit(UpdateEmployeeDetailsError());

//       print(er.toString());
//     });
//   }

//   EmployeeDetails? employeeDetails;
//   void getDetailsEmployeeData({id}) {
//     emit(GetEmployeeDetailsLoading());
//     DioHelper.getData(
//       path: 'https://192.168.1.100:49/api/Employee/Details ? id = 7',
//       token: uid,
//     ).then((value) {
//       employeeDetails = EmployeeDetails.fromJson(value.data);
//       emit(GetEmployeeDetailsSucsses());
//     }).catchError((er) {
//       emit(GetEmployeeDetailsError());

//       print(er.toString());
//     });
//   }
// }
