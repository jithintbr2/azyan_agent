class AddSchemeModel {
  bool status;
  String message;
  List<Data> data;

  AddSchemeModel({this.status, this.message, this.data});

  AddSchemeModel.fromJson(Map<String, dynamic> json) {
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
  int masterSchemeId;
  String schemeName;

  Data({this.masterSchemeId, this.schemeName});

  Data.fromJson(Map<String, dynamic> json) {
    masterSchemeId = json['master_scheme_id'];
    schemeName = json['schemeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['master_scheme_id'] = this.masterSchemeId;
    data['schemeName'] = this.schemeName;
    return data;
  }
}