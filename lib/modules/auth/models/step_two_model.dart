class StepTwoModel {
  bool? status;
  String? message;
  Data? data;

  StepTwoModel({this.status, this.message, this.data});

  StepTwoModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? fullName;
  List<String>? ownerEmail;
  List<String>? ownerPhoneNumber;
  List<String>? password;
  List<String>? nationalty;

  Data(
      {this.fullName,
        this.ownerEmail,
        this.ownerPhoneNumber,
        this.password,
        this.nationalty});

  Data.fromJson(Map<String, dynamic> json) {
    if(json['full_name']==null){
      fullName = [];
    }else{
      fullName = json['full_name'].cast<String>();
    }
    if(json['owner_email']==null){
      ownerEmail = [];
    }else{
      ownerEmail = json['owner_email'].cast<String>();
    }
    if(json['owner_phone_number']==null){
      ownerPhoneNumber = [];
    }else{
      ownerPhoneNumber = json['owner_phone_number'].cast<String>();
    }
    if(json['password']==null){
      password = [];
    }else{
      password = json['password'].cast<String>();
    }
    if(json['nationalty']==null){
      nationalty = [];
    }else{
      nationalty = json['nationalty'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['owner_email'] = this.ownerEmail;
    data['owner_phone_number'] = this.ownerPhoneNumber;
    data['password'] = this.password;
    data['nationalty'] = this.nationalty;
    return data;
  }
}