
class AdminModel {
  AdminModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

   AdminModel.fromJson(Map<String, dynamic> json) {
        status= json["status"];
        message= json["message"];
        data= json["data"]!=null?Data.fromJson(json["data"]):null;
      }
}

class Data {
  Data({
    this.username,
    this.email,
    this.branchId,
    this.pictureUrl,
    this.roles,
    this.token,
    this.expiresOn,
  });

  String? username;
  dynamic email;
  int? branchId;
  dynamic pictureUrl;
  List<String>? roles;
  String? token;
  DateTime? expiresOn;

   Data.fromJson(Map<String, dynamic> json) {
        username= json["username"];
        email= json["email"];
        branchId= json["branchId"];
        pictureUrl= json["pictureUrl"];
        roles= List<String>.from(json["roles"].map((x) => x));
        token= json["token"];
        expiresOn= DateTime.parse(json["expiresOn"]);
      }
}
