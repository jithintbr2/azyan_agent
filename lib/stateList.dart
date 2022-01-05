class StateModel {
  bool status;
  String message;
  Data data;

  StateModel({this.status, this.message, this.data});

  StateModel.fromJson(Map<String, dynamic> json) {
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
  List<States> states;
  List<Relationship> relationship;

  Data({this.states, this.relationship});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['states'] != null) {
      states = new List<States>();
      json['states'].forEach((v) {
        states.add(new States.fromJson(v));
      });
    }
    if (json['relationship'] != null) {
      relationship = new List<Relationship>();
      json['relationship'].forEach((v) {
        relationship.add(new Relationship.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.states != null) {
      data['states'] = this.states.map((v) => v.toJson()).toList();
    }
    if (this.relationship != null) {
      data['relationship'] = this.relationship.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  int stateId;
  String stateName;
  List<Districts> districts;

  States({this.stateId, this.stateName, this.districts});

  States.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    stateName = json['state_name'];
    if (json['districts'] != null) {
      districts = new List<Districts>();
      json['districts'].forEach((v) {
        districts.add(new Districts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    if (this.districts != null) {
      data['districts'] = this.districts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Districts {
  int districtId;
  int stateId;
  String districtName;

  Districts({this.districtId, this.stateId, this.districtName});

  Districts.fromJson(Map<String, dynamic> json) {
    districtId = json['district_id'];
    stateId = json['state_id'];
    districtName = json['district_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['district_id'] = this.districtId;
    data['state_id'] = this.stateId;
    data['district_name'] = this.districtName;
    return data;
  }
}

class Relationship {
  int relationId;
  String relation;

  Relationship({this.relationId, this.relation});

  Relationship.fromJson(Map<String, dynamic> json) {
    relationId = json['relation_id'];
    relation = json['relation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['relation_id'] = this.relationId;
    data['relation'] = this.relation;
    return data;
  }
}