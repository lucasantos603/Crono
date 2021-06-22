import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class Connection {
  void addUsuario(
      String nome, String date, String uf, String tipoDeCabelo) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore db = FirebaseFirestore.instance;

    Map<String, dynamic> toJson() =>
        {"nome": nome, "date": date, "uf": uf, "tipoDeCabelo": tipoDeCabelo};

    db.collection("usuarios").add(
        {"nome": nome, "date": date, "uf": uf, "tipoDeCabelo": tipoDeCabelo});
  }
}
