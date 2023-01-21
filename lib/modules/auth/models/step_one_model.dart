class StepOneModel {
  bool? status;
  String? message;
  Data? data;

  StepOneModel({this.status, this.message, this.data});

  StepOneModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? bussinessType;
  List<String>? englishName;
  List<String>? arabicName;
  List<String>? phoneNumber;
  List<String>? businessEmail;
  List<String>? categoryId;

  Data(
      {this.bussinessType,
        this.englishName,
        this.arabicName,
        this.phoneNumber,
        this.businessEmail,
        this.categoryId});

  Data.fromJson(Map<String, dynamic> json) {

    if(json['bussiness_type']==null){
      bussinessType = [];
    }else{
      bussinessType=json['bussiness_type'].cast<String>();
    }
    if(json['english_name']==null){
      englishName = [];
    }else{
      englishName=json['english_name'].cast<String>();
    }
    if(json['arabicName']==null){
      arabicName = [];
    }else{
      arabicName=json['arabicName'].cast<String>();
    }
    if(json['phone_number']==null){
      phoneNumber = [];
    }else{
      phoneNumber=json['phone_number'].cast<String>();
    }
    if(json['business_email']==null){
      businessEmail = [];
    }else{
      businessEmail = json['business_email'].cast<String>();
    }
    if(json['category_id']==null){
      categoryId = [];
    }else{
      categoryId = json['category_id'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bussiness_type'] = this.bussinessType;
    data['english_name'] = this.englishName;
    data['arabic_name'] = this.arabicName;
    data['phone_number'] = this.phoneNumber;
    data['business_email'] = this.businessEmail;
    data['category_id'] = this.categoryId;
    return data;
  }
}