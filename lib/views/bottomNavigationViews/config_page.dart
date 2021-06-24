import 'package:CRONO/core/core.dart';
import 'package:CRONO/shared/widgets/button_widget.dart';
import 'package:CRONO/views/teste/teste_porosidade_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:CRONO/core/app_text_styles.dart';
import 'package:CRONO/views/initial/ajuda_page.dart';
import 'package:CRONO/views/initial/initial_page.dart';
import 'package:CRONO/views/initial/login/login_page.dart';
import 'package:CRONO/views/initial/privacidade_page.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  bool _tratamentoDozeMeses;
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerCabelo = TextEditingController();
  TextEditingController _controllerData = TextEditingController();
  TextEditingController _controllerUf = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    _Pegarnome();
    super.initState();
  }

  // ignore: non_constant_identifier_names
  Future _Pegarnome() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseFirestore db = FirebaseFirestore.instance;

    if (auth.currentUser != null) {
      DocumentSnapshot snapshot =
          await db.collection("usuarios").doc(auth.currentUser.uid).get();

      setState(() {
        _controllerNome.text = snapshot['nome'].toString();
        _controllerCabelo.text = snapshot['tipodecabelo'].toString();
        _controllerData.text = snapshot['date'].toString();
        _controllerUf.text = snapshot['uf'].toString();
        _radioDozeMeses = snapshot['tratamentodozemeses'] == true ? 1 : 0;
        _email = snapshot['email'].toString();
        ultimoResultado = snapshot['teste'].toString();
      });
    }
  }

  void _deletarDados() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection("usuarios").doc(auth.currentUser.uid).delete();

    try {
      await FirebaseAuth.instance.currentUser.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void _editarDados() async {
    _tratamentoDozeMeses = _radioDozeMeses == 1 ? true : false;

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    await db.collection("usuarios").doc(auth.currentUser.uid).set({
      "nome": "${_controllerNome.text}",
      "tipodecabelo": "${_controllerCabelo.text}",
      "tratamentodozemeses": "${_tratamentoDozeMeses}",
      "date": "${_controllerData.text}",
      "uf": "${_controllerUf.text}",
      "email": "${_email}",
      "teste": "${ultimoResultado}"
    });
    Navigator.pop(context);
  }

  String ultimoResultado;
  int _radioDozeMeses;
  String _email;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        top: true,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Configurações",
                    textAlign: TextAlign.left,
                    style: AppTextStyles.heading30,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Text(
                          "• Editar perfil",
                          style: AppTextStyles.menuItemBold,
                          textAlign: TextAlign.start,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(content:
                                      StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                    return SingleChildScrollView(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 15),
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Text(
                                              "Nome:",
                                              textAlign: TextAlign.left,
                                              style: AppTextStyles.labelBold,
                                            ),
                                            SizedBox(height: 10),
                                            TextFormField(
                                              autofocus: true,
                                              keyboardType: TextInputType.text,
                                              style: TextStyle(fontSize: 15),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        18, 8, 18, 8),
                                                //labelText: '​E-mail',
                                                hintText: "Nome",
                                                filled: true,
                                                fillColor: AppColors.white,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.zero),
                                              ),
                                              controller: _controllerNome,
                                              // ignore: missing_return
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "Informe um valor válido";
                                                }
                                              },
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              "Estado:",
                                              textAlign: TextAlign.left,
                                              style: AppTextStyles.labelBold,
                                            ),
                                            SizedBox(height: 10),
                                            TextFormField(
                                              autofocus: true,
                                              keyboardType: TextInputType.text,
                                              style: TextStyle(fontSize: 15),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        18, 8, 18, 8),
                                                //labelText: '​E-mail',
                                                hintText: "Estado",
                                                filled: true,
                                                fillColor: AppColors.white,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.zero),
                                              ),
                                              controller: _controllerUf,
                                              // ignore: missing_return
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "Informe um valor válido";
                                                }
                                              },
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              "Tipo de cabelo:",
                                              textAlign: TextAlign.left,
                                              style: AppTextStyles.labelBold,
                                            ),
                                            SizedBox(height: 10),
                                            TextFormField(
                                              autofocus: true,
                                              keyboardType: TextInputType.text,
                                              style: TextStyle(fontSize: 15),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        18, 8, 18, 8),
                                                //labelText: '​E-mail',
                                                hintText: "Tipo de cabelo",
                                                filled: true,
                                                fillColor: AppColors.white,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.zero),
                                              ),
                                              controller: _controllerCabelo,
                                              // ignore: missing_return
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "Informe um valor válido";
                                                }
                                              },
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              "Fez tratamento com química\nnos últimos 12 meses?",
                                              textAlign: TextAlign.left,
                                              style: AppTextStyles.labelBold,
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: RadioListTile(
                                                      title: Text("Sim"),
                                                      value: 1,
                                                      groupValue:
                                                          _radioDozeMeses,
                                                      onChanged: (int escolha) {
                                                        setState(() {
                                                          _radioDozeMeses =
                                                              escolha;
                                                        });
                                                      }),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: RadioListTile(
                                                      title: Text("Não"),
                                                      value: 0,
                                                      groupValue:
                                                          _radioDozeMeses,
                                                      onChanged: (int escolha) {
                                                        setState(() {
                                                          _radioDozeMeses =
                                                              escolha;
                                                        });
                                                      }),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            // ignore: deprecated_member_use
                                            Center(
                                              child: ButtonWidget.green(
                                                  label: "Enviar",
                                                  onTap: () async {
                                                    if (_formKey.currentState
                                                        .validate()) {
                                                      _editarDados();
                                                    }
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  })));
                        },
                      ),
                      SizedBox(height: 15),
                      InkWell(
                        child: Text(
                          "• Refazer teste de porosidade",
                          style: AppTextStyles.menuItemBold,
                        ),
                        onTap: () {
                          print("Clicado: Termos de uso");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TestePorosidadePage()),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      InkWell(
                        child: Text(
                          "• Ajuda",
                          style: AppTextStyles.menuItemBold,
                        ),
                        onTap: () {
                          //print("Clicado: Ajuda");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AjudaPage()),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      InkWell(
                        child: Text(
                          "• Termos de uso",
                          style: AppTextStyles.menuItemBold,
                        ),
                        onTap: () {
                          print("Clicado: Termos de uso");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacidadePage()),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      InkWell(
                        child: Text(
                          "• Desativar conta",
                          style: AppTextStyles.menuItemBold,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      "Deseja desativar a conta?",
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      // ignore: deprecated_member_use
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        child: Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ButtonWidget.green(
                                                label: "Confirmar",
                                                onTap: () async {
                                                  _deletarDados();
                                                  await FirebaseAuth.instance
                                                      .signOut();
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              InitialPage()));
                                                },
                                              ),
                                              ButtonWidget.red(
                                                label: "Cancelar",
                                                onTap: () =>
                                                    Navigator.pop(context),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 50),
                                          Text(
                                            "Atenção: esta ação não poderá ser desfeita",
                                            textAlign: TextAlign.left,
                                            style: AppTextStyles.small,
                                          ),
                                          SizedBox(height: 50),
                                        ],
                                      ),
                                    ],
                                  ));
                        },
                      ),
                      SizedBox(height: 15),
                      InkWell(
                        child: Text(
                          "• Sair da conta",
                          style: AppTextStyles.menuItemBold,
                        ),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      InitialPage()));
                        },
                      ),
                    ],
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
