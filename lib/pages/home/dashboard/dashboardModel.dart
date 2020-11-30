class DashboardModel {
  List<Busca> busca;

  DashboardModel({this.busca});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    if (json['busca'] != null) {
      busca = new List<Busca>();
      json['busca'].forEach((v) {
        busca.add(new Busca.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.busca != null) {
      data['busca'] = this.busca.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Busca {
  String sId;
  int average;
  int month;

  Busca({this.sId, this.average, this.month});

  Busca.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    average = json['average'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['average'] = this.average;
    data['month'] = this.month;
    return data;
  }
}
