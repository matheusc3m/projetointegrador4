class DestilacaoModel {
  String date;
  String sId;
  int porcentdePerca;
  int iV;
  List<ListaDestilacao> lista;

  DestilacaoModel(
      {this.date, this.iV, this.porcentdePerca, this.sId, this.lista});

  DestilacaoModel.fromJson(Map<String, dynamic> json) {
    if (json['lista'] != null) {
      lista = new List<ListaDestilacao>();
      json['lista'].forEach((v) {
        lista.add(new ListaDestilacao.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lista != null) {
      data['lista'] = this.lista.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListaDestilacao {
  String date;
  String sId;
  int porcentdePerca;
  int iV;

  ListaDestilacao({this.date, this.sId, this.porcentdePerca, this.iV});

  ListaDestilacao.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    sId = json['_id'];
    porcentdePerca = json['porcentdePerca'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['_id'] = this.sId;
    data['porcentdePerca'] = this.porcentdePerca;
    data['__v'] = this.iV;
    return data;
  }
}
