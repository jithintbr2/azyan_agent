class SearchSchemeModel {
  bool status;
  String message;
  List<Data> data;

  SearchSchemeModel({this.status, this.message, this.data});

  SearchSchemeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int customerSchemeMasterId;
  String schemeNo;
  String schemeName;
  int customerId;
  int schemeAmount;
  String beginDate;
  int numberOfInstallments;
  int phoneNumber;
  String firstName;
  String lastName;

  Data(
      {this.customerSchemeMasterId,
        this.schemeNo,
        this.schemeName,
        this.customerId,
        this.schemeAmount,
        this.beginDate,
        this.numberOfInstallments,
        this.phoneNumber,
        this.firstName,
        this.lastName});

  Data.fromJson(Map<String, dynamic> json) {
    customerSchemeMasterId = json['customerSchemeMasterId'];
    schemeNo = json['schemeNo'];
    schemeName = json['schemeName'];
    customerId = json['customerId'];
    schemeAmount = json['schemeAmount'];
    beginDate = json['beginDate'];
    numberOfInstallments = json['numberOfInstallments'];
    phoneNumber = json['phoneNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerSchemeMasterId'] = this.customerSchemeMasterId;
    data['schemeNo'] = this.schemeNo;
    data['schemeName'] = this.schemeName;
    data['customerId'] = this.customerId;
    data['schemeAmount'] = this.schemeAmount;
    data['beginDate'] = this.beginDate;
    data['numberOfInstallments'] = this.numberOfInstallments;
    data['phoneNumber'] = this.phoneNumber;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}