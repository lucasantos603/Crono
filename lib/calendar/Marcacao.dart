class Marcacao {
  String _nomeProduto = "";
  String _date = "";
  String _etapa = "";


  Marcacao();


  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "nomeProduto": this.nomeProduto,
      "date": this.date,
      "etapa": this.etapa
    };

    return map;
  }

  // ignore: unnecessary_getters_setters
  String get etapa => _etapa;

  // ignore: unnecessary_getters_setters
  set etapa(String value) {
    _etapa = value;
  }

  // ignore: unnecessary_getters_setters
  String get date => _date;

  // ignore: unnecessary_getters_setters
  set date(String value) {
    _date = value;
  }

  // ignore: unnecessary_getters_setters
  String get nomeProduto => _nomeProduto;

  // ignore: unnecessary_getters_setters
  set nomeProduto(String value) {
    _nomeProduto = value;
  }
}