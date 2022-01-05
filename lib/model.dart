class RersultModel {
  bool status;
  String message;
  Data data;

  RersultModel({this.status, this.message, this.data});

  RersultModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String token;
  String fullName;
  String mobNumber;

  Data({this.token, this.fullName, this.mobNumber});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    fullName = json['fullName'];
    mobNumber = json['mobNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['fullName'] = this.fullName;
    data['mobNumber'] = this.mobNumber;
    return data;
  }
}