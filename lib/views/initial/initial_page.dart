import 'package:flutter/material.dart';
import 'package:CRONO/core/core.dart';
import 'package:CRONO/shared/widgets/button_widget.dart';
import 'package:CRONO/views/initial/login/cadastro_page.dart';
import 'package:CRONO/views/initial/login/login_page.dart';
import 'widgets/appbar_widget.dart';
import 'widgets/footer_widget.dart';

class InitialPage extends StatefulWidget {
  InitialPage({Key key}) : super(key: key);
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
  }

  void _openCadastroPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Cadastro()),
    );
  }

  void _openLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        decoration: BoxDecoration(color: AppColors.white),
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Olá!", style: AppTextStyles.titleBold),
            SizedBox(height: 30),
            Text.rich(
              TextSpan(
                  text: "Eu sou o ",
                  style: AppTextStyles.heading20,
                  children: [
                    TextSpan(
                      text: "CRONO",
                      style: AppTextStyles.mainHeading,
                    ),
                    TextSpan(
                      text:
                          " e posso te ajudar a manter um cronograma capilar organizado",
                      style: AppTextStyles.heading20,
                    ),
                  ]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonWidget.blue(
                      label: "Criar uma conta",
                      onTap: () => _openCadastroPage(),
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
                        "ou clique aqui para acessar sua conta",
                        style: AppTextStyles.bodyLink,
                      ),
                      onTap: () => _openLoginPage(),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}
