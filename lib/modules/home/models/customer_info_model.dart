class CustomerInfoModel {
  String? status;
  String? message;
  Data? data;

  CustomerInfoModel({this.status, this.message, this.data});

  CustomerInfoModel.fromJson(Map<String, dynamic> json) {
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
  Customer? customer;
  List<CustomerBank>? customerBank;

  Data({this.customer, this.customerBank});

  Data.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['customer_bank'] != null) {
      customerBank = <CustomerBank>[];
      json['customer_bank'].forEach((v) {
        customerBank!.add(new CustomerBank.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.customerBank != null) {
      data['customer_bank'] =
          this.customerBank!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  int? hasBank;
  int? businessId;
  String? createdAt;
  String? updatedAt;

  Customer(
      {this.id,
        this.fullName,
        this.email,
        this.phoneNumber,
        this.hasBank,
        this.businessId,
        this.createdAt,
        this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    hasBank = json['has_bank'];
    businessId = json['business_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['has_bank'] = this.hasBank;
    data['business_id'] = this.businessId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CustomerBank {
  int? id;
  String? accountNumber;
  String? iban;
  int? customerId;
  int? bankId;
  String? createdAt;
  String? updatedAt;

  CustomerBank(
      {this.id,
        this.accountNumber,
        this.iban,
        this.customerId,
        this.bankId,
        this.createdAt,
        this.updatedAt});

  CustomerBank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountNumber = json['account_number'];
    iban = json['iban'];
    customerId = json['customer_id'];
    bankId = json['bank_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account_number'] = this.accountNumber;
    data['iban'] = this.iban;
    data['customer_id'] = this.customerId;
    data['bank_id'] = this.bankId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}