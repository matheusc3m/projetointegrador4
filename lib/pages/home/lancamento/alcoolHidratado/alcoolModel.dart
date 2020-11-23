class ModelAlcool {
  String sId;
  String data;
  String hora;
  String massaE;
  String temperatura;
  String fatorCorrecao;
  String inpm;
  String ph;
  String condutividade;
  String tipoAlcool;
  int iV;

  ModelAlcool(
      {this.sId,
      this.data,
      this.hora,
      this.massaE,
      this.temperatura,
      this.fatorCorrecao,
      this.inpm,
      this.ph,
      this.condutividade,
      this.tipoAlcool,
      this.iV});

  ModelAlcool.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    data = json['data'];
    hora = json['Hora'];
    massaE = json['MassaE'];
    temperatura = json['Temperatura'];
    fatorCorrecao = json['FatorCorrecao'];
    inpm = json['Inpm'];
    ph = json['Ph'];
    condutividade = json['Condutividade'];
    tipoAlcool = json['TipoAlcool'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['data'] = this.data;
    data['Hora'] = this.hora;
    data['MassaE'] = this.massaE;
    data['Temperatura'] = this.temperatura;
    data['FatorCorrecao'] = this.fatorCorrecao;
    data['Inpm'] = this.inpm;
    data['Ph'] = this.ph;
    data['Condutividade'] = this.condutividade;
    data['TipoAlcool'] = this.tipoAlcool;
    data['__v'] = this.iV;
    return data;
  }
}
