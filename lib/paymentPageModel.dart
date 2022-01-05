class PaymnetDetails {
  bool status;
  String message;
  List<Data> data;

  PaymnetDetails({this.status, this.message, this.data});

  PaymnetDetails.fromJson(Map<String, dynamic> json) {
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
  int customerSchemeDetailsId;
  int installmentNumber;
  int installmentAmount;
  String installmentDate;

  Data(
      {this.customerSchemeDetailsId,
        this.installmentNumber,
        this.installmentAmount,
        this.installmentDate});

  Data.fromJson(Map<String, dynamic> json) {
    customerSchemeDetailsId = json['customerSchemeDetailsId'];
    installmentNumber = json['installment_number'];
    installmentAmount = json['installment_amount'];
    installmentDate = json['installment_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerSchemeDetailsId'] = this.customerSchemeDetailsId;
    data['installment_number'] = this.installmentNumber;
    data['installment_amount'] = this.installmentAmount;
    data['installment_date'] = this.installmentDate;
    return data;
  }
}