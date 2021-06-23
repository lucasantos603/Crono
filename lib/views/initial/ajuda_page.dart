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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("• Qual meu tipo de cabelo?",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.left),
                          SizedBox(height: 10),
                          Text(
                              "A tabela abaixo lista os graus de curvatura do fio. Veja qual se assemelha mais ao seu para se cadastrar corretamente.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Image.asset(AppImages.tiposdecabelo),
                          SizedBox(height: 45),
                          Text("• Como adicionar marcações no calendário?",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.left),
                          SizedBox(height: 10),
                          Text(
                              "Na página inicial você encontrará uma imagem semelhante a esta abaixo, sinalizando quais tratamentos devem ser feitos por semana.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Center(
                            child: Image.asset(
                              'assets/images/ajuda-comousar-1.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                              "Ainda na página inicial, mais abaixo, você encontrará o calendário. Você pode navegar através dos ícones < e > para mudar de mês, caso queira fazer marcação em meses anteriores, ou apenas clicar no dia que desejar fazer a marcação e, em seguida, clicar em ADICIONAR MARCAÇÃO, como no exemplo:",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Center(
                            child: Image.asset(
                                'assets/images/ajuda-comousar-2.png',
                                fit: BoxFit.fill),
                          ),
                          SizedBox(height: 20),
                          Text(
                              "Uma janela abrirá contendo o formulário de marcação. Preencha as informações solicitadas e clique no botão ADICIONAR ou clique na área escura da tela para sair.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Center(
                            child: Image.asset(
                                'assets/images/ajuda-comousar-3.png',
                                fit: BoxFit.fill),
                          ),
                          SizedBox(height: 15),
                          Text(
                              "Agora sua marcação já está visível no calendário, sinalizada pelo ponto no dia escolhido.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Center(
                            child: Image.asset(
                                'assets/images/ajuda-comousar-4.png',
                                fit: BoxFit.fill),
                          ),
                          SizedBox(height: 15),
                          Text(
                              "Clicando novamente no dia da marcação, você conseguirá ver as informações das marcações feitas, como na imagem abaixo:",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Center(
                            child: Image.asset(
                                'assets/images/ajuda-comousar-5.png',
                                fit: BoxFit.fill),
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
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}
