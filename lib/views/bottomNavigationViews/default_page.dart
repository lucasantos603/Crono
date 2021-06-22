import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:CRONO/calendar/add_event_calendar.dart';
import 'package:CRONO/core/core.dart';
import 'package:CRONO/views/bottomNavigationViews/config_page.dart';
// import 'package:CRONO/views/bottomNavigationViews/home_page.dart';
import 'package:CRONO/views/bottomNavigationViews/content_page.dart';
import 'package:CRONO/views/bottomNavigationViews/home_pagex.dart';
import 'package:CRONO/views/bottomNavigationViews/profile_page.dart';
import 'package:CRONO/views/initial/widgets/appbar_widget.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({Key key}) : super(key: key);

  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  int _indiceAtual = 0;
  @override
  List<Widget> telas = [
    HomePage(),
    ContentPage(),
    ProfilePage(),
    ConfigPage(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(),
      /*
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(color: AppColors.white),
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: telas[_indiceAtual],
          ),
        ),
      ),
      */

      body: Container(
        //decoration: BoxDecoration(color: AppColors.white),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              title: Text("Inicio"),
              icon: Icon(
                CupertinoIcons.house_fill,
                size: 40,
              ),
            ),
            BottomNavigationBarItem(
              title: Text("Saiba Mais"),
              icon: Icon(
                CupertinoIcons.text_quote,
                size: 40,
              ),
            ),
            BottomNavigationBarItem(
              title: Text("Perfil"),
              icon: Icon(
                CupertinoIcons.person_fill,
                size: 40,
              ),
            ),
            BottomNavigationBarItem(
              title: Text("Configurações"),
              icon: Icon(
                CupertinoIcons.gear_alt_fill,
                size: 40,
              ),
            ),
          ]),
    );
  }
}
