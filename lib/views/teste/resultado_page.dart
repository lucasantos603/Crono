import 'package:flutter/material.dart';
import 'package:CRONO/core/core.dart';
import 'package:CRONO/shared/widgets/button_widget.dart';
import 'package:CRONO/views/bottomNavigationViews/default_page.dart';
import 'package:CRONO/views/initial/widgets/appbar_widget.dart';

class CalendarPage extends StatefulWidget {
  String valor;
  CalendarPage({this.valor});
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(),
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
                            "Como seu cabelo ${widget.valor.toLowerCase()}, criamos este cronograma para você",
                            style: AppTextStyles.heading20,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          widget.valor == 'Afundou Imediatamente'
                              ? Image.asset(
                                  AppImages.cronogramaafundouimediamente)
                              : Text(""),
                          widget.valor == 'Afundou Lentamente'
                              ? Image.asset(
                                  AppImages.cronogramaafundoulentamente)
                              : Text(""),
                          widget.valor == 'Boiou'
                              ? Image.asset(AppImages.cronogramaboiou)
                              : Text(""),
                          SizedBox(height: 40),
                          ButtonWidget.blue(
                            label: "Ir para página inicial",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DefaultPage()),
                              );
                            },
                          ),
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
