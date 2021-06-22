import 'dart:convert';

class UserModel {
  String email;
  String senha;
  String nome;
  String date;
  String uf;
  String tipodecabelo;

  UserModel({
    this.email,
    this.senha,
    this.nome,
    this.date,
    this.uf,
    this.tipodecabelo,
  });

  UserModel copyWith({
    String email,
    String senha,
    String nome,
    String date,
    String uf,
    String tipodecabelo,
  }) {
    return UserModel(
      email: email ?? this.email,
      senha: senha ?? this.senha,
      nome: nome ?? this.nome,
      date: date ?? this.date,
      uf: uf ?? this.uf,
      tipodecabelo: tipodecabelo ?? this.tipodecabelo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'senha': senha,
      'nome': nome,
      'date': date,
      'uf': uf,
      'tipodecabelo': tipodecabelo,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      senha: map['senha'],
      nome: map['nome'],
      date: map['date'],
      uf: map['uf'],
      tipodecabelo: map['tipodecabelo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(email: $email, senha: $senha, nome: $nome, date: $date, uf: $uf, tipodecabelo: $tipodecabelo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.email == email &&
        other.senha == senha &&
        other.nome == nome &&
        other.date == date &&
        other.uf == uf &&
        other.tipodecabelo == tipodecabelo;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        senha.hashCode ^
        nome.hashCode ^
        date.hashCode ^
        uf.hashCode ^
        tipodecabelo.hashCode;
  }
}
