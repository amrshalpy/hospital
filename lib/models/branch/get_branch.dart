class GetBranches {
  String? status;
  String? message;
  List<BrancheData>? data = [];

  GetBranches.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    if (json['data'] != null) {
      json['data'].forEach((element) {
        data!.add(BrancheData.fromJson(element));
      });
    }
  }
}

class BrancheData {
  String? nameAr;
  String? nameEn;
  int? branchId;
  int? companyId;
  String? note;
  String? address;
  String? mangerMobile;
  String? mangerName;
  String? taxNumber;
  String? commercialNumber;

  BrancheData.fromJson(Map<String, dynamic> json) {
    nameAr = json["nameAr"];
    nameEn = json["nameEn"];
    branchId = json["branchId"];
    companyId = json["companyId"];
    note = json["note"];
    address = json["address"];
    mangerMobile = json["mangerMobile"];
    mangerName = json["mangerName"];
    taxNumber = json["taxNumber"];
    commercialNumber = json["commercialNumber"];
  }
}
