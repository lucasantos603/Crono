import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:CRONO/core/core.dart';
import 'package:CRONO/models/Usuario.dart';
import 'package:CRONO/shared/widgets/button_widget.dart';
import 'package:CRONO/views/initial/privacidade_page.dart';
import 'package:CRONO/views/initial/widgets/appbar_widget.dart';
import 'package:CRONO/views/initial/widgets/footer_widget.dart';
import 'package:CRONO/views/teste/teste_porosidade_page.dart';
import 'package:intl/date_symbol_data_local.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  static const List<String> _shortWeekdays = <String>[
    'S',
    'T',
    'Q',
    'Q',
    'S',
    'S',
    'D',
  ];

  static const List<String> _shortMonths = <String>[
    'Jan',
    'Fev',
    'Mar',
    'Abr',
    'Mai',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out',
    'Nov',
    'Dez',
  ];

  static const List<String> _months = <String>[
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => hour.toString() + " Uhr";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  //Variaveis
  DateTime selectedDate = DateTime.now();
  String tipodecabelo = "Selecione";
  String uf = "Escolha";
  String _mensagemErro = "";
  bool checkbox = false;
  bool tratamentoDozeMeses = false;

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  //Controladores
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerConfirmarsenha = TextEditingController();
  TextEditingController _controllerNome = TextEditingController();

  _validarCampos() {
    //Recupera dados dos campos
    String email = _controllerEmail.text;
    String nome = _controllerNome.text;
    String senha = _controllerSenha.text;
    String senha2 = _controllerConfirmarsenha.text;
    String date = selectedDate.toString();
    String uf = this.uf;
    bool checkbox = this.checkbox;
    String tipodecabelo = this.tipodecabelo;

    if (email.isNotEmpty && email.contains("@")) {
      if (nome.isNotEmpty) {
        if (senha.isNotEmpty && senha.length >= 6) {
          if (senha2.isNotEmpty && senha == senha2) {
            if (tipodecabelo != "Selecione") {
              if (uf != "Escolha") {
                if (checkbox == true) {
                  setState(() {
                    _mensagemErro = "";
                  });

                  Usuario usuario = Usuario();
                  usuario.email = email;
                  usuario.nome = nome;
                  usuario.senha = senha;
                  usuario.uf = uf;
                  usuario.date = date;
                  usuario.tipodecabelo = tipodecabelo;
                  usuario.tratamentodozemeses =
                      _radioDozeMeses == 1 ? true : false;

                  _cadastrarUsuario(usuario);
                } else {
                  setState(() {
                    _mensagemErro =
                        "Aceite os termos de uso para concluir o cadastro.";
                  });
                }
              } else {
                setState(() {
                  _mensagemErro = "Selecione seu Estado.";
                });
              }
            } else {
              setState(() {
                _mensagemErro = "Selecione seu tipo de cabelo.";
              });
            }
          } else {
            setState(() {
              _mensagemErro = "Erro ao confirmar senha. Digite novamente.";
            });
          }
        } else {
          setState(() {
            _mensagemErro = "Digite uma senha com mais de 6 caracteres.";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Digite o seu nome corretamente.";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "O e-mail deve estar no formato nome@provedor.com";
      });
    }
  }

  void _openPrivacidadePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PrivacidadePage()),
    );
  }

  _cadastrarUsuario(Usuario usuario) async {
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      //Salvar dados do usuário
      WidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp();

      FirebaseFirestore db = FirebaseFirestore.instance;

      db.collection("usuarios").doc(firebaseUser.user.uid).set(usuario.toMap());

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => TestePorosidadePage()));
    }).catchError((error) {
      setState(() {
        _mensagemErro =
            "Erro ao cadastrar usuario, verifique os campos e tente novamente!";
      });
    });
  }

  int _radioDozeMeses;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Container(
            //color: AppColors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(),
                    SizedBox(width: 20),
                    Text(
                      "Cadastro",
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nome",
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.labelBold,
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: _controllerNome,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 15),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(18, 8, 18, 8),
                                    hintText: "Digite seu Nome",
                                    filled: true,
                                    fillColor: AppColors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.zero),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "E-mail",
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.labelBold,
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: _controllerEmail,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 15),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(18, 8, 18, 8),
                                    hintText: "Digite seu e-mail",
                                    filled: true,
                                    fillColor: AppColors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.zero),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Data de nascimento",
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.labelBold,
                                ),
                                SizedBox(height: 10),
                                Container(
                                  color: AppColors.white,
                                  height: 150,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime(2021, 1, 1),
                                    minimumYear: 1900,
                                    maximumYear: 2021,
                                    onDateTimeChanged: (DateTime newDateTime) {
                                      selectedDate = newDateTime;
                                    },
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Preencha com atenção, não é possível alterar posteriormente",
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.small,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Estado",
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.labelBold,
                                ),
                                SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all()),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: uf,
                                        icon: const Icon(Icons.arrow_drop_down),
                                        iconSize: 35,
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            uf = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Escolha',
                                          'Acre',
                                          'Alagoas',
                                          'Amapá',
                                          'Amazonas',
                                          'Bahia',
                                          'Ceará',
                                          'Distrito Federal',
                                          'Espírito Santo',
                                          'Goiás',
                                          'Maranhão',
                                          'Mato Grosso',
                                          'Mato Grosso do Sul',
                                          'Minas Gerais',
                                          'Pará',
                                          'Paraíba',
                                          'Paraná',
                                          'Pernambuco',
                                          'Piauí',
                                          'Rio de Janeiro',
                                          'Rio Grande do Norte',
                                          'Rio Grande do Sul',
                                          'Rondônia',
                                          'Roraima',
                                          'Santa Catarina',
                                          'São Paulo',
                                          'Sergipe',
                                          'Tocantins'
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
                                SizedBox(height: 20),
                                Text(
                                  "Tipo de cabelo",
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.labelBold,
                                ),
                                SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all()),
                                  child: DropdownButtonHideUnderline(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 18),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: tipodecabelo,
                                        icon: const Icon(Icons.arrow_drop_down),
                                        iconSize: 35,
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            tipodecabelo = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Selecione',
                                          'Liso',
                                          'Ondulado',
                                          'Cacheado',
                                          'Crespo'
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
                                SizedBox(height: 20),
                                Text(
                                  "Senha",
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.labelBold,
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  obscureText: true,
                                  controller: _controllerSenha,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 15),
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(18, 8, 18, 8),
                                      hintText: "Digite sua Senha",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Escolha uma senha com no mínimo 6 caracteres",
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.small,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Preencha com atenção, não é possível alterar posteriormente",
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.small,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Confirme sua senha",
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.labelBold,
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  obscureText: true,
                                  controller: _controllerConfirmarsenha,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 15),
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(18, 8, 18, 8),
                                      hintText: "Confirme a senha",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Fez tratamento químico nos últimos 12 meses?",
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.labelBold,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: <Widget>[
                                    //_radioDozeMeses
                                    Expanded(
                                      flex: 1,
                                      child: RadioListTile(
                                          title: Text("Sim"),
                                          value: 1,
                                          groupValue: _radioDozeMeses,
                                          onChanged: (int escolha) {
                                            setState(() {
                                              _radioDozeMeses = escolha;
                                            });
                                          }),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: RadioListTile(
                                          title: Text("Não"),
                                          value: 0,
                                          groupValue: _radioDozeMeses,
                                          onChanged: (int escolha) {
                                            setState(() {
                                              _radioDozeMeses = escolha;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                    child: Column(
                                  children: <Widget>[
                                    CheckboxListTile(
                                        title: Text("Aceito os termos de uso"),
                                        activeColor: Colors.green,
                                        value: checkbox,
                                        onChanged: (bool valor) {
                                          setState(() {
                                            checkbox = valor;
                                          });
                                        }),
                                    GestureDetector(
                                      child: Text(
                                          "Clique aqui para ler os termos de uso",
                                          style: AppTextStyles.bodyLink),
                                      onTap: () => _openPrivacidadePage(),
                                    ),
                                  ],
                                )),
                                SizedBox(height: 30),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ButtonWidget.green(
                                          label: "Próximo",
                                          onTap: () {
                                            _validarCampos();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Text(
                                  _mensagemErro,
                                  style: TextStyle(
                                    color: AppColors.red,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                              //
                            ),
                          ]),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}
