class ProfileModel {
  bool status;
  String message;
  Data data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  int userId;
  int mobNumber;
  String fistName;
  String lastName;
  String address;
  String agentCode;
  String dateOfBirth;
  String emailId;

  Data(
      {this.userId,
        this.mobNumber,
        this.fistName,
        this.lastName,
        this.address,
        this.agentCode,
        this.dateOfBirth,
        this.emailId});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    mobNumber = json['mobNumber'];
    fistName = json['fistName'];
    lastName = json['lastName'];
    address = json['address'];
    agentCode = json['agentCode'];
    dateOfBirth = json['dateOfBirth'];
    emailId = json['emailId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['mobNumber'] = this.mobNumber;
    data['fistName'] = this.fistName;
    data['lastName'] = this.lastName;
    data['address'] = this.address;
    data['agentCode'] = this.agentCode;
    data['dateOfBirth'] = this.dateOfBirth;
    data['emailId'] = this.emailId;
    return data;
  }
}