class DueReportModel {
  String message;
  bool status;
  Data data;

  DueReportModel({this.message, this.status, this.data});

  DueReportModel.fromJson(Map<String, dynamic> json) {
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
  List<DueReport> dueReport;
  int totalDue;

  Data({this.dueReport, this.totalDue});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['due_report'] != null) {
      dueReport = new List<DueReport>();
      json['due_report'].forEach((v) {
        dueReport.add(new DueReport.fromJson(v));
      });
    }
    totalDue = json['total_due'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dueReport != null) {
      data['due_report'] = this.dueReport.map((v) => v.toJson()).toList();
    }
    data['total_due'] = this.totalDue;
    return data;
  }
}

class DueReport {
  String firstName;
  String lastName;
  String schemeName;
  int installmentNumber;
  int installmentAmount;
  String installmentDate;

  DueReport(
      {this.firstName,
        this.lastName,
        this.schemeName,
        this.installmentNumber,
        this.installmentAmount,
        this.installmentDate});

  DueReport.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    schemeName = json['scheme_name'];
    installmentNumber = json['installment_number'];
    installmentAmount = json['installment_amount'];
    installmentDate = json['installmentDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['scheme_name'] = this.schemeName;
    data['installment_number'] = this.installmentNumber;
    data['installment_amount'] = this.installmentAmount;
    data['installmentDate'] = this.installmentDate;
    return data;
  }
}