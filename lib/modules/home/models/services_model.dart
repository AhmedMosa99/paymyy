class ServicesModel {
  bool? status;
  String? message;
  List<Data>? data;

  ServicesModel({this.status, this.message, this.data});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? logo;
  String? createdAt;
  String? updatedAt;
  bool? assigned;

  Data(
      {this.id,
        this.name,
        this.description,
        this.logo,
        this.createdAt,
        this.updatedAt,
        this.assigned});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    assigned = json['assigned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['logo'] = this.logo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['assigned'] = this.assigned;
    return data;
  }
}