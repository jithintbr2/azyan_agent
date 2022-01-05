class DashboardModel {
  bool status;
  String message;
  Data data;

  DashboardModel({this.status, this.message, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
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
  String agentName;
  int existingCustomers;
  int activeSchemes;
  int newBusiness;
  int todaysCollection;

  Data(
      {this.agentName,
        this.existingCustomers,
        this.activeSchemes,
        this.newBusiness,
        this.todaysCollection});

  Data.fromJson(Map<String, dynamic> json) {
    agentName = json['agentName'];
    existingCustomers = json['existing_customers'];
    activeSchemes = json['active_schemes'];
    newBusiness = json['new_business'];
    todaysCollection = json['todays_collection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agentName'] = this.agentName;
    data['existing_customers'] = this.existingCustomers;
    data['active_schemes'] = this.activeSchemes;
    data['new_business'] = this.newBusiness;
    data['todays_collection'] = this.todaysCollection;
    return data;
  }
}