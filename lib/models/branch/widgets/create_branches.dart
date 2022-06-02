class CreateBranche {
  String? status;
  String? message;
  Data? data;

  CreateBranche.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? nameAr;
  String? address;
  String? mangerName;
  String? taxNumber;
  String? commercialNumber;
  String? mangerMobile;
  String? nameEn;
  int? branchId;
  int? companyId;
  String? note;

  Data.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr'];
    address = json['address'];
    taxNumber = json['taxNumber'];
    mangerName = json['mangerName'];
    commercialNumber = json['commercialNumber'];
    mangerMobile = json['mangerMobile'];
    nameEn = json['nameEn'];
    branchId = json['branchId'];
    note = json['note'];
    companyId = json['companyId'];
  }
}
