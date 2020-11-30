class DestilacaoModel {
  String date;
  String sId;
  int perda;
  int iV;
  List<ListaDestilacao> lista;

  DestilacaoModel({this.date, this.iV, this.perda, this.sId, this.lista});

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
  int perda;
  int iV;

  ListaDestilacao({this.date, this.sId, this.perda, this.iV});

  ListaDestilacao.fromJson(Map<String, dynamic> json) {
    date = json['data'];
    sId = json['_id'];
    perda = json['perda'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.date;
    data['_id'] = this.sId;
    data['perda'] = this.perda;
    data['__v'] = this.iV;
    return data;
  }
}
