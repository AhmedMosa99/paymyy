class UserModel {
  bool? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? fullName;
  String? nationalId;
  String? email;
  String? phoneNumber;
  String? bussinessType;
  int? businessId;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? token;

  Data(
      {this.fullName,
        this.nationalId,
        this.email,
        this.phoneNumber,
        this.bussinessType,
        this.businessId,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    nationalId = json['national_id'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    bussinessType = json['bussiness_type'];
    businessId = json['business_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['national_id'] = this.nationalId;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['bussiness_type'] = this.bussinessType;
    data['business_id'] = this.businessId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['token'] = this.token;
    return data;
  }
}