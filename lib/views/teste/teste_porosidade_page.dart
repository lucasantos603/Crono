import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CRONO/core/core.dart';
import 'package:CRONO/shared/widgets/button_widget.dart';
import 'package:CRONO/views/initial/widgets/appbar_widget.dart';
import 'package:CRONO/views/teste/resultado_page.dart';
import 'package:CRONO/views/teste/teste_porosidade_pare_bloc.dart';

class TestePorosidadePage extends StatefulWidget {
  @override
  TestePorosidadePageState createState() => TestePorosidadePageState();
}

class TestePorosidadePageState extends State<TestePorosidadePage> {
  testePorosidadePageBloc bloc = testePorosidadePageBloc();
  TextEditingController _controllerTeste = TextEditingController();

  void _openCalendarPage(String resultado) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CalendarPage(
                valor: resultado,
              )),
    );
  }

  void _salvarDados() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    DocumentSnapshot snapshot =
        await db.collection("usuarios").doc(auth.currentUser.uid).get();

    String _nome = snapshot['nome'];
    String _tipoCabelo = snapshot['tipodecabelo'];
    String _tratamento = snapshot['tratamentodozemeses'].toString();
    String _date = snapshot['date'];
    String _uf = snapshot['uf'];
    String _email = snapshot['email'];

    db.collection("usuarios").doc(auth.currentUser.uid).set({
      "nome": "${_nome}",
      "tipodecabelo": "${_tipoCabelo}",
      "tratamentodozemeses": "${_tratamento}",
      "date": "${_date}",
      "uf": "${_uf}",
      "email": "${_email}",
      "teste": "${bloc.dropdownValue}"
    });
  }

  Widget buttonWidgetDemoFuncional() {
    return ButtonWidget.blue(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "O que aconteceu com o fio após o teste?",
                                style: AppTextStyles.heading20,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all()),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: bloc.dropdownValue,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 35,
                                      elevation: 16,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.grey,
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          bloc.dropdownValue = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'Escolha',
                                        'Boiou',
                                        'Afundou Lentamente',
                                        'Afundou Imediatamente'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (bloc.dropdownValue == "Escolha") {
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.05);
                                        } else {
                                          return AppColors.green;
                                        }
                                      },
                                    ),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: AppColors.green)),
                                  ),
                                  onPressed: () {
                                    if (bloc.dropdownValue == "Escolha") {
                                      return null;
                                    } else {
                                      String resultado = bloc.dropdownValue;
                                      _salvarDados();
                                      _openCalendarPage(resultado);
                                      // bloc.guardar(resultado);
                                      // print(resultado);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Criar cronograma",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            });
      },
      label: "Fazer o teste agora",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(color: AppColors.white),
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(),
                    SizedBox(width: 20),
                    Text(
                      "Teste de porosidade",
                      textAlign: TextAlign.left,
                      style: AppTextStyles.heading30,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            "Determinar o nível de porosidade do seu cabelo é muito importante para que você possa escolher o tratamento capilar correto. E o teste de porosidade vai te ajudar nesse diagnóstico!\n\nEle é bem simples e você só vai precisar de um copo com água filtrada e um fio do seu cabelo. Após colocar o fio no copo e esperar 10 minutos, você vai observar como ele reage.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          Image.asset(
                            AppImages.coposteste,
                            height: 150,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "São três possíveis comportamentos que vão apontar a sua porosidade capilar:",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                                text: "• Se o fio de cabelo ",
                                style: AppTextStyles.body,
                                children: [
                                  TextSpan(
                                      text: "boiar no copo",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: ", ele tem baixa porosidade.",
                                    style: AppTextStyles.body,
                                  ),
                                ]),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                                text: "• Se o fio de cabelo ",
                                style: AppTextStyles.body,
                                children: [
                                  TextSpan(
                                      text: "afundar lentamente",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: ", ele tem porosidade normal.",
                                    style: AppTextStyles.body,
                                  ),
                                ]),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                                text: "• Se o fio de cabelo ",
                                style: AppTextStyles.body,
                                children: [
                                  TextSpan(
                                      text: "afundar imediatamente",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: ", ele tem alta porosidade.",
                                    style: AppTextStyles.body,
                                  ),
                                ]),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Texto por SALON LINE. Como descobrir a porosidade do seu cabelo. [2020]. Disponível em: <https://salonline.com.br/porosidade-capilar/> Acesso em: 26 maio 2021.",
                            style: AppTextStyles.small,
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 30),
                          buttonWidgetDemoFuncional(),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
