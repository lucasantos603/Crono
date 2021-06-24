import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:CRONO/core/app_text_styles.dart';
import 'package:CRONO/shared/widgets/button_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String date = "";
  String tipodecabelo = "";
  String nome = "";
  String uf = "";
  String teste = "";
  String email = "";

  void initState() {
    super.initState();
    _Pegarnome();
    super.initState();
  }

  Future _Pegarnome() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseFirestore db = FirebaseFirestore.instance;

    if (auth.currentUser != null) {
      DocumentSnapshot snapshot =
          await db.collection("usuarios").doc(auth.currentUser.uid).get();

      setState(() {
        nome = snapshot['nome'].toString();
        tipodecabelo = snapshot['tipodecabelo'].toString();
        date = snapshot['date'].toString();
        uf = snapshot['uf'].toString();
        teste = snapshot['teste'].toString();
        email = snapshot['email'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        top: true,
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Perfil",
                    textAlign: TextAlign.left,
                    style: AppTextStyles.heading30,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "Nome: ",
                              style: AppTextStyles.labelBold,
                              children: [
                                TextSpan(
                                  text: nome,
                                  style: AppTextStyles.info,
                                ),
                              ]),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                              text: "E-mail: ",
                              style: AppTextStyles.labelBold,
                              children: [
                                TextSpan(
                                  text: email,
                                  style: AppTextStyles.info,
                                ),
                              ]),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                              text: "Data de nascimento: ",
                              style: AppTextStyles.labelBold,
                              children: [
                                TextSpan(
                                  text: date == ""
                                      ? ""
                                      : DateFormat("dd/MM/yyyy")
                                          .format(DateTime.parse(date)),
                                  style: AppTextStyles.info,
                                ),
                              ]),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                              text: "Estado: ",
                              style: AppTextStyles.labelBold,
                              children: [
                                TextSpan(
                                  text: uf,
                                  style: AppTextStyles.info,
                                ),
                              ]),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                              text: "Tipo de cabelo: ",
                              style: AppTextStyles.labelBold,
                              children: [
                                TextSpan(
                                  text: tipodecabelo,
                                  style: AppTextStyles.info,
                                ),
                              ]),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                              text:
                                  "Resultado do último\nteste de porosidade: ",
                              style: AppTextStyles.labelBold,
                              children: [
                                TextSpan(
                                  text: teste.toLowerCase(),
                                  style: AppTextStyles.info,
                                ),
                              ]),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
