class CollectionReportModel {
  String message;
  bool status;
  Data data;

  CollectionReportModel({this.message, this.status, this.data});

  CollectionReportModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<CollectionReport> collectionReport;
  int totalCollection;

  Data({this.collectionReport, this.totalCollection});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['collection_report'] != null) {
      collectionReport = new List<CollectionReport>();
      json['collection_report'].forEach((v) {
        collectionReport.add(new CollectionReport.fromJson(v));
      });
    }
    totalCollection = json['total_collection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collectionReport != null) {
      data['collection_report'] =
          this.collectionReport.map((v) => v.toJson()).toList();
    }
    data['total_collection'] = this.totalCollection;
    return data;
  }
}

class CollectionReport {
  int paymentCollectionMasterId;
  String invoiceNumber;
  int customerId;
  String firstName;
  String lastName;
  int mobileNumber;
  String schemeName;
  String schemeNo;
  int amount;
  String datePaid;

  CollectionReport(
      {this.paymentCollectionMasterId,
        this.invoiceNumber,
        this.customerId,
        this.firstName,
        this.lastName,
        this.mobileNumber,
        this.schemeName,
        this.schemeNo,
        this.amount,
        this.datePaid});

  CollectionReport.fromJson(Map<String, dynamic> json) {
    paymentCollectionMasterId = json['payment_collection_master_id'];
    invoiceNumber = json['invoice_number'];
    customerId = json['customer_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNumber = json['mobile_number'];
    schemeName = json['scheme_name'];
    schemeNo = json['scheme_no'];
    amount = json['amount'];
    datePaid = json['date_paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_collection_master_id'] = this.paymentCollectionMasterId;
    data['invoice_number'] = this.invoiceNumber;
    data['customer_id'] = this.customerId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile_number'] = this.mobileNumber;
    data['scheme_name'] = this.schemeName;
    data['scheme_no'] = this.schemeNo;
    data['amount'] = this.amount;
    data['date_paid'] = this.datePaid;
    return data;
  }
}