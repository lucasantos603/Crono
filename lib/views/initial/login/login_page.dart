import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:CRONO/core/core.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:CRONO/core/core.dart';
import 'package:CRONO/models/Usuario.dart';
import 'package:CRONO/shared/widgets/button_widget.dart';
// import 'package:CRONO/views/initial/initial_page.dart';
// import 'package:CRONO/shared/widgets/button_widget.dart';
import 'package:CRONO/views/initial/login/cadastroPage.dart';
import 'package:CRONO/views/teste/teste_porosidade_page.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/footer_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Widget codigoDoBrian() {}

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  void _openCadastroPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Cadastro()),
    );
  }

  _validarCampos() {
    //Recupera dados dos campos
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (email.isNotEmpty && email.contains("@")) {
      if (senha.isNotEmpty) {
        setState(() {
          _mensagemErro = "";
        });

        Usuario usuario = Usuario();
        usuario.email = email;
        usuario.senha = senha;

        _logarUsuario(usuario);
      } else {
        setState(() {
          _mensagemErro = "Preencha a senha!";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o E-mail utilizando @";
      });
    }
  }

  _logarUsuario(Usuario usuario) async {
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .signInWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => TestePorosidadePage()));
    }).catchError((error) {
      setState(() {
        _mensagemErro =
            "Erro ao autenticar usuário, verifique e-mail e senha e tente novamente!";
      });
    });
  }

  Future _verificarUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    String usuarioLogado = auth.currentUser.uid;
    if (usuarioLogado != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => TestePorosidadePage()));
    }
  }

  @override
  void initState() {
    _verificarUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Container(
            color: AppColors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(),
                    SizedBox(width: 20),
                    Text(
                      "Login",
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextField(
                                controller: _controllerEmail,
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(18, 8, 18, 8),
                                  hintText: "Email",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                controller: _controllerSenha,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(18, 8, 18, 8),
                                  hintText: "Senha",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ButtonWidget.blue(
                                    label: "Entrar",
                                    onTap: () {
                                      _validarCampos();
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: Text(
                                        "ou clique aqui para criar nova conta",
                                        style: AppTextStyles.bodyLink),
                                    onTap: () => _openCadastroPage(),
                                  ),
                                  Center(
                                    child: Text(
                                      _mensagemErro,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                        //
                      ),
                    ),
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
