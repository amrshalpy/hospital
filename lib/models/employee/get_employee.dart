class GetEmployee {
  String? message;
  String? status;
  List<Data>? data = [];
  GetEmployee.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['data'].forEach((element) {
      data!.add(Data.fromJson(element));
    });
  }
}

class Data {
  String? nameAr;
  String? nameEn;
  int? branchId;
  int? empNo;
  String? job;
  String? note;
  int? companyId;
  String? birthDate;
  String? email;
  String? address;
  String? gender;
  String? phoneNumber;
  String? phoneNumberSecond;
  String? socialStatus;
  String? numberIdentification;
  String? datePermanent;
  String? dateExp;
  String? dateAppointment;
  String? typeIdentification;
  String? exprience;
  String? specialiation;
  String? cerficationDate;
  dynamic sallery;
  int? remeningDay;
  String? statusProccess;
  String? nationalityTitel;
  int? nationalityId;
  String? scientificDisciplinesTitel;
  int? scientificDisciplinesId;
  String? userName;
  String? password;
  String? confirmPassword;
  int? role;
  Data.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    branchId = json['branchId'];
    empNo = json['empNo'];
    job = json['job'];
    note = json['note'];
    companyId = json['companyId'];
    birthDate = json['birthDate'];
    email = json['email'];
    address = json['address'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    phoneNumberSecond = json['phoneNumberSecond'];
    socialStatus = json['socialStatus'];
    numberIdentification = json['numberIdentification'];
    datePermanent = json['datePermanent'];
    dateExp = json['dateExp'];
    dateAppointment = json['dateAppointment'];
    typeIdentification = json['typeIdentification'];
    exprience = json['exprience'];
    specialiation = json['specialiation'];
    cerficationDate = json['cerficationDate'];
    sallery = json['sallery'];
    remeningDay = json['remeningDay'];
    statusProccess = json['statusProccess'];
    nationalityTitel = json['nationalityTitel'];
    nationalityId = json['nationalityId'];
    scientificDisciplinesTitel = json['scientificDisciplinesTitel'];
    scientificDisciplinesId = json['scientificDisciplinesId'];
    userName = json['userName'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    role = json['role'];
  }
}
