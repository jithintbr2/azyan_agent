class TransationHistory {
  bool status;
  String message;
  List<Data> data;

  TransationHistory({this.status, this.message, this.data});

  TransationHistory.fromJson(Map<String, dynamic> json) {
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
  String head;
  String className;
  String dueDate;
  String amount;

  Data({this.head, this.className, this.dueDate, this.amount});

  Data.fromJson(Map<String, dynamic> json) {
    head = json['head'];
    className = json['className'];
    dueDate = json['dueDate'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['head'] = this.head;
    data['className'] = this.className;
    data['dueDate'] = this.dueDate;
    data['amount'] = this.amount;
    return data;
  }
}