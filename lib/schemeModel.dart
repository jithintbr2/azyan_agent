class ListSchemeModel {
  bool status;
  String message;
  List<Data> data;

  ListSchemeModel({this.status, this.message, this.data});

  ListSchemeModel.fromJson(Map<String, dynamic> json) {
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
  int schemeAmount;
  String beginDate;
  int numberOfInstallments;

  Data(
      {this.customerSchemeMasterId,
        this.schemeNo,
        this.schemeName,
        this.schemeAmount,
        this.beginDate,
        this.numberOfInstallments});

  Data.fromJson(Map<String, dynamic> json) {
    customerSchemeMasterId = json['customerSchemeMasterId'];
    schemeNo = json['schemeNo'];
    schemeName = json['schemeName'];
    schemeAmount = json['schemeAmount'];
    beginDate = json['beginDate'];
    numberOfInstallments = json['numberOfInstallments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerSchemeMasterId'] = this.customerSchemeMasterId;
    data['schemeNo'] = this.schemeNo;
    data['schemeName'] = this.schemeName;
    data['schemeAmount'] = this.schemeAmount;
    data['beginDate'] = this.beginDate;
    data['numberOfInstallments'] = this.numberOfInstallments;
    return data;
  }
}