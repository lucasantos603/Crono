import 'package:flutter/material.dart';
import 'package:CRONO/core/core.dart';
import 'widgets/appbar_widget.dart';
import 'widgets/footer_widget.dart';

class AjudaPage extends StatefulWidget {
  @override
  _AjudaPageState createState() => _AjudaPageState();
}

class _AjudaPageState extends State<AjudaPage> {
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
                      "Ajuda",
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
                          Text("Qual meu tipo de cabelo?",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.center),
                          SizedBox(height: 10),
                          Text(
                              "A tabela abaixo lista os graus de curvatura do fio. Veja qual se assemelha mais ao seu para se cadastrar corretamente.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Image.asset(AppImages.tiposdecabelo),
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
      bottomNavigationBar: FooterWidget(),
    );
  }
}
