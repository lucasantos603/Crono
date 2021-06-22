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

      // print ("Teste");
      // var dadosJson = json.decode(snapshot.metadata["nome"];
      //     print ("Teste2");
      // print (dadosJson["nome"].toString());
      setState(() {
        nome = snapshot['nome'].toString();
        tipodecabelo = snapshot['tipodecabelo'].toString();
        date = snapshot['date'].toString();
        uf = snapshot['uf'].toString();
        teste = snapshot['teste'].toString();
      });
    }
    // else{
    //
    // Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: (context) => login_page()));
    //
    //  }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        top: true,
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            children: [
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
                        Row(
                          children: [
                            Text(
                              "Nome:",
                              textAlign: TextAlign.left,
                              style: AppTextStyles.labelBold,
                            ),
                            SizedBox(width: 10),
                            Text(
                              nome,
                              textAlign: TextAlign.left,
                              style: AppTextStyles.body,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Data de nascimento:",
                              textAlign: TextAlign.left,
                              style: AppTextStyles.labelBold,
                            ),
                            SizedBox(width: 10),
                            Text(
                              date == ""?"":DateFormat("dd/MM/yyyy").format(DateTime.parse(date)),
                              textAlign: TextAlign.left,
                              style: AppTextStyles.body,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Estado:",
                              textAlign: TextAlign.left,
                              style: AppTextStyles.labelBold,
                            ),
                            SizedBox(width: 10),
                            Text(
                              uf,
                              textAlign: TextAlign.left,
                              style: AppTextStyles.body,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Tipo de cabelo:",
                              textAlign: TextAlign.left,
                              style: AppTextStyles.labelBold,
                            ),
                            SizedBox(width: 10),
                            Text(
                              tipodecabelo,
                              textAlign: TextAlign.left,
                              style: AppTextStyles.body,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Resultado do último teste de porosidade:",
                              textAlign: TextAlign.left,
                              style: AppTextStyles.labelBold,
                            ),
                            SizedBox(width: 10),
                            Text(
                              teste,
                              textAlign: TextAlign.left,
                              style: AppTextStyles.body,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        //Text("Nome :${nome}"),
                        //Text("Data de nascimento :${date}"),
                        //Text("Estado :${uf}"),
                        //Text("Tipo de cabelo :${tipodecabelo}"),
                        //Text("Teste :${teste}"),
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
