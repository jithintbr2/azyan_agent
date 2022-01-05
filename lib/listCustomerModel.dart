class ListCustomerModel {
  bool status;
  String message;
  List<Data> data;

  ListCustomerModel({this.status, this.message, this.data});

  ListCustomerModel.fromJson(Map<String, dynamic> json) {
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
  int customerId;
  int mobileNumber;
  String firstName;
  String lastName;
  String presentAddressLine1;
  String presentAddressLine2;
  String dateOfBirth;
  String emailId;
  String createdDate;

  Data(
      {this.customerId,
        this.mobileNumber,
        this.firstName,
        this.lastName,
        this.presentAddressLine1,
        this.presentAddressLine2,
        this.dateOfBirth,
        this.emailId,
        this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    mobileNumber = json['mobileNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    presentAddressLine1 = json['presentAddressLine1'];
    presentAddressLine2 = json['presentAddressLine2'];
    dateOfBirth = json['dateOfBirth'];
    emailId = json['emailId'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['mobileNumber'] = this.mobileNumber;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['presentAddressLine1'] = this.presentAddressLine1;
    data['presentAddressLine2'] = this.presentAddressLine2;
    data['dateOfBirth'] = this.dateOfBirth;
    data['emailId'] = this.emailId;
    data['createdDate'] = this.createdDate;
    return data;
  }
}