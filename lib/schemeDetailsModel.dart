class SchemeDetailsList {
  bool status;
  String message;
  Data data;

  SchemeDetailsList({this.status, this.message, this.data});

  SchemeDetailsList.fromJson(Map<String, dynamic> json) {
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
  int customerSchemeMasterId;
  String schemeNo;
  String schemeName;
  int schemeAmount;
  String beginDate;
  int numberOfInstallments;
  List<InstallmentDetails> installmentDetails;

  Data(
      {this.customerSchemeMasterId,
        this.schemeNo,
        this.schemeName,
        this.schemeAmount,
        this.beginDate,
        this.numberOfInstallments,
        this.installmentDetails});

  Data.fromJson(Map<String, dynamic> json) {
    customerSchemeMasterId = json['customerSchemeMasterId'];
    schemeNo = json['schemeNo'];
    schemeName = json['schemeName'];
    schemeAmount = json['schemeAmount'];
    beginDate = json['beginDate'];
    numberOfInstallments = json['numberOfInstallments'];
    if (json['installment_details'] != null) {
      installmentDetails = new List<InstallmentDetails>();
      json['installment_details'].forEach((v) {
        installmentDetails.add(new InstallmentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerSchemeMasterId'] = this.customerSchemeMasterId;
    data['schemeNo'] = this.schemeNo;
    data['schemeName'] = this.schemeName;
    data['schemeAmount'] = this.schemeAmount;
    data['beginDate'] = this.beginDate;
    data['numberOfInstallments'] = this.numberOfInstallments;
    if (this.installmentDetails != null) {
      data['installment_details'] =
          this.installmentDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InstallmentDetails {
  int customerSchemeDetailsId;
  int installmentNumber;
  int installmentAmount;
  String installmentDate;
  String hasPaid;
  String datePaid;

  InstallmentDetails(
      {this.customerSchemeDetailsId,
        this.installmentNumber,
        this.installmentAmount,
        this.installmentDate,
        this.hasPaid,
        this.datePaid});

  InstallmentDetails.fromJson(Map<String, dynamic> json) {
    customerSchemeDetailsId = json['customerSchemeDetailsId'];
    installmentNumber = json['installmentNumber'];
    installmentAmount = json['installmentAmount'];
    installmentDate = json['installmentDate'];
    hasPaid = json['hasPaid'];
    datePaid = json['datePaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerSchemeDetailsId'] = this.customerSchemeDetailsId;
    data['installmentNumber'] = this.installmentNumber;
    data['installmentAmount'] = this.installmentAmount;
    data['installmentDate'] = this.installmentDate;
    data['hasPaid'] = this.hasPaid;
    data['datePaid'] = this.datePaid;
    return data;
  }
}