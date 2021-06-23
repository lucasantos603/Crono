// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:CRONO/calendar/add_event_calendar.dart';
import 'package:CRONO/views/bottomNavigationViews/default_page.dart';
import 'package:CRONO/views/bottomNavigationViews/home_pagex.dart';
import 'package:CRONO/views/initial/initial_page.dart';
import 'package:CRONO/views/teste/resultado_page.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:tcc_crono/views/teste/calendar_page.dart';

import 'views/teste/teste_porosidade_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  initializeDateFormatting('pt_BR', null);

  initializeDateFormatting().then((_) => runApp(
        MaterialApp(
          /*localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
      locale: Locale('pt', 'BR'),*/
          title: 'CRONO',
          home: InitialPage(),
          debugShowCheckedModeBanner: false,
        ),
      ));
  /*
  runApp(
    MaterialApp(
      /*localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
      locale: Locale('pt', 'BR'),*/
      title: 'CRONO',
      home: InitialPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
  */
}
