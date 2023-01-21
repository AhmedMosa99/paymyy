class StepThreeModel {
  bool? status;
  String? message;
  Data? data;

  StepThreeModel({this.status, this.message, this.data});

  StepThreeModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? accountName;
  List<String>? accountNumber;
  List<String>? iban;
  List<String>? bankId;

  Data({this.accountName, this.accountNumber, this.iban, this.bankId});

  Data.fromJson(Map<String, dynamic> json) {
    if(json['account_name']==null){
      accountName = [];
    }else{
      accountName = json['account_name'].cast<String>();
    }
    if(json['account_number']==null){
      accountNumber = [];
    }else{
      accountNumber = json['account_number'].cast<String>();
    }
    if(json['iban']==null){
      iban = [];
    }else{
      iban = json['iban'].cast<String>();
    }
    if(json['bank_id']==null){
      iban = [];
    }else{
      bankId = json['bank_id'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_name'] = this.accountName;
    data['account_number'] = this.accountNumber;
    data['iban'] = this.iban;
    data['bank_id'] = this.bankId;
    return data;
  }
}