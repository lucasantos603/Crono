import 'dart:convert';

// class Usuario {
//   String _email = "";
//   String _senha = "";
//   String _nome = "";
//   String _date = "";
//   String _uf = "";
//   String _tipodecabelo = "";

//   Map<String, dynamic> map = {
//       "nome" : this._nome,
//       "email" : this._email,
//       "date" : this._date,
//       "uf" : this._uf,
//       "tipodecabelo" : this._tipodecabelo
//     };

//     return map;

//   }

//   // ignore: unnecessary_getters_setters
//   String get tipodecabelo => _tipodecabelo;
//   // ignore: unnecessary_getters_setters
//   set tipodecabelo(String value) {
//     _tipodecabelo = value;
//   }

// // ignore: unnecessary_getters_setters
//   String get uf => _uf;
// // ignore: unnecessary_getters_setters
//   set uf(String value) {
//     _uf = value;
//   }

// // ignore: unnecessary_getters_setters
//   String get date => _date;
// // ignore: unnecessary_getters_setters
//   set date(String value) {
//     _date = value;
//   }

// // ignore: unnecessary_getters_setters
//   String get nome => _nome;
// // ignore: unnecessary_getters_setters
//   set nome(String value) {
//     _nome = value;
//   }

// // ignore: unnecessary_getters_setters
//   String get senha => _senha;
// // ignore: unnecessary_getters_setters
//   set senha(String value) {
//     _senha = value;
//   }

//   String get email => _email;

//   // ignore: unnecessary_getters_setters
//   set email(String value) {
//     _email = value;
//   }
// }

class Usuario {
  String _email = "";
  String _senha = "";
  String _nome = "";
  String _date = "";
  String _uf = "";
  String _tipodecabelo = "";
  bool _tratamentodozemeses;

  Usuario();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "nome": this.nome,
      "email": this.email,
      "date": this.date,
      "uf": this.uf,
      "tipodecabelo": this.tipodecabelo,
      "tratamentodozemeses": this.tratamentodozemeses
    };

    return map;
  }


  bool get tratamentodozemeses => _tratamentodozemeses;

  set tratamentodozemeses(bool value) {
    _tratamentodozemeses = value;
  } // ignore: unnecessary_getters_setters
  String get tipodecabelo => _tipodecabelo;
  // ignore: unnecessary_getters_setters
  set tipodecabelo(String value) {
    _tipodecabelo = value;
  }

// ignore: unnecessary_getters_setters
  String get uf => _uf;
// ignore: unnecessary_getters_setters
  set uf(String value) {
    _uf = value;
  }

// ignore: unnecessary_getters_setters
  String get date => _date;
// ignore: unnecessary_getters_setters
  set date(String value) {
    _date = value;
  }

// ignore: unnecessary_getters_setters
  String get nome => _nome;
// ignore: unnecessary_getters_setters
  set nome(String value) {
    _nome = value;
  }

// ignore: unnecessary_getters_setters
  String get senha => _senha;
// ignore: unnecessary_getters_setters
  set senha(String value) {
    _senha = value;
  }

  // ignore: unnecessary_getters_setters
  String get email => _email;
  // ignore: unnecessary_getters_setters
  set email(String value) {
    _email = value;
  }
}
