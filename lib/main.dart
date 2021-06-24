import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:CRONO/views/initial/initial_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  initializeDateFormatting('pt_BR', null);

  initializeDateFormatting().then((_) => runApp(
        MaterialApp(
          title: 'CRONO',
          home: InitialPage(),
          debugShowCheckedModeBanner: false,
        ),
      ));
}
