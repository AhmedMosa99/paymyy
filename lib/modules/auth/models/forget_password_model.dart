class ForgetPasswordModel {
  bool? status;
  String? message;
  Data? data;

  ForgetPasswordModel({this.status, this.message, this.data});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? email;

  Data({this.email});

  Data.fromJson(Map<String, dynamic> json) {
    if(json['email']==null){
      email = [];
    }else{
      email=json['email'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;

    return data;
  }
}