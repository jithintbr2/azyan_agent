class InvoiceModel {
  bool status;
  String message;
  Data data;

  InvoiceModel({this.status, this.message, this.data});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
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
  String schemeNo;
  String schemeName;
  String invoiceNumber;
  String datePaid;
  String customerName;
  String address;
  int amount;
  List<InstallmentDetails> installmentDetails;

  Data(
      {this.schemeNo,
        this.schemeName,
        this.invoiceNumber,
        this.datePaid,
        this.customerName,
        this.address,
        this.amount,
        this.installmentDetails});

  Data.fromJson(Map<String, dynamic> json) {
    schemeNo = json['scheme_no'];
    schemeName = json['scheme_name'];
    invoiceNumber = json['invoice_number'];
    datePaid = json['date_paid'];
    customerName = json['customer_name'];
    address = json['address'];
    amount = json['amount'];
    if (json['installment_details'] != null) {
      installmentDetails = new List<InstallmentDetails>();
      json['installment_details'].forEach((v) {
        installmentDetails.add(new InstallmentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scheme_no'] = this.schemeNo;
    data['scheme_name'] = this.schemeName;
    data['invoice_number'] = this.invoiceNumber;
    data['date_paid'] = this.datePaid;
    data['customer_name'] = this.customerName;
    data['address'] = this.address;
    data['amount'] = this.amount;
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

  InstallmentDetails(
      {this.customerSchemeDetailsId,
        this.installmentNumber,
        this.installmentAmount});

  InstallmentDetails.fromJson(Map<String, dynamic> json) {
    customerSchemeDetailsId = json['customer_scheme_details_id'];
    installmentNumber = json['installment_number'];
    installmentAmount = json['installment_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_scheme_details_id'] = this.customerSchemeDetailsId;
    data['installment_number'] = this.installmentNumber;
    data['installment_amount'] = this.installmentAmount;
    return data;
  }
}