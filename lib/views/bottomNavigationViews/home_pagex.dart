// import 'dart:html';

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:tcc_crono/calendar/add_event_calendar.dart';
import 'package:CRONO/calendar/event.dart';
import 'package:CRONO/core/app_text_styles.dart';
import 'package:CRONO/core/core.dart';
import 'package:CRONO/views/initial/login/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<DateTime, List<Event>> selectedEvents = {};
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String nome;
  String ultimoResultado;

  TextEditingController _eventController = TextEditingController();
  TextEditingController _marcaController = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  TextEditingController _tratamentoController = TextEditingController();

  void initState() {
    super.initState();
    selectedEvents = {};
    _retornarEventos();
    _Pegarnome();
    super.initState();
  }

  Future _Pegarnome() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseFirestore db = FirebaseFirestore.instance;

    if (auth.currentUser != null) {
      DocumentSnapshot snapshot =
          await db.collection("usuarios").doc(auth.currentUser.uid).get();

      // print ("Teste");
      // var dadosJson = json.decode(snapshot.metadata["nome"];
      //     print ("Teste2");
      // print (dadosJson["nome"].toString());

      setState(() {
        nome = snapshot['nome'].toString();
        ultimoResultado = snapshot['teste'].toString();
      });
    }
    // else{
    //
    // Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: (context) => login_page()));
    //
    //  }
  }

  _adicionarEvento() async {
    //Salvar dados do usuário
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    if (_estagio == 0) {
      etapa = "Hidratação";
    } else if (_estagio == 1) {
      etapa = "Nutrição";
    } else {
      etapa = "Reconstrução";
    }

    DocumentReference ref = await db.collection("marcacao").add({
      "nomeProduto": "${_eventController.text}",
      "date": "${selectedDay}",
      "etapa": "${etapa.toString()}",
      "marca": "${_marcaController.text}",
      "usuario": auth.currentUser.uid
    });
  }

  // TextEditingController _nomeProdutoController = _eventController;

  String etapa;

  List<Event> _getEventfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  void dispose() {
    _eventController.dispose();
    _marcaController.dispose();
    _tratamentoController.dispose();
    super.dispose();
  }

  _retornarEventos() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();

    FirebaseFirestore db = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;

    QuerySnapshot querySnapshot = await db
        .collection("marcacao")
        .where("usuario", isEqualTo: auth.currentUser.uid)
        .get();

    setState(() {
      for (DocumentSnapshot item in querySnapshot.docs) {
        print("teste ${item}");
        if (item['date'].toString() != null) {
          if (selectedEvents[DateTime.parse(item['date'].toString())] != null) {
            selectedEvents[DateTime.parse(item['date'].toString())].add(
              Event(
                title: item['nomeProduto'],
                marca: item['marca'],
                tratamento: item['etapa'],
              ),
            );
          } else {
            selectedEvents[DateTime.parse(item['date'].toString())] = [
              Event(
                  title: item['nomeProduto'],
                  marca: item['marca'],
                  tratamento: item['etapa'])
            ];
          }
        }
      }
    });
  }

  int _estagio;
  @override
  Widget build(BuildContext context) {
    // _retornarEventos();
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 5),
            Text(
              "Olá, ${nome}!",
              style: AppTextStyles.heading30,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
                "Seu último resultado do teste de porosidade: ${ultimoResultado}"),
            ultimoResultado == 'Afundou Imediatamente'
                ? Image.asset(AppImages.cronogramaafundouimediamente)
                : Text(""),
            ultimoResultado == 'Afundou Lentamente'
                ? Image.asset(AppImages.cronogramaafundoulentamente)
                : Text(""),
            ultimoResultado == 'Boiou'
                ? Image.asset(AppImages.cronogramaboiou)
                : Text(""),
            SizedBox(height: 40),
            Text(
              "Cronograma atual:",
              style: AppTextStyles.body,
              textAlign: TextAlign.left,
            ),

            SizedBox(
              child: TableCalendar(
                // locale: 'en-US',

                focusedDay: focusedDay,
                firstDay: DateTime(2000),
                lastDay: DateTime(2050),
                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,

                //Day Changed
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },

                eventLoader: _getEventfromDay,

                //16:32 primeiro video
                //To Style the Calendar

                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  defaultDecoration: BoxDecoration(
                    // color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  weekendDecoration: BoxDecoration(
                    // color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    formatButtonShowsNext: true,
                    formatButtonDecoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0)),
                    formatButtonTextStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),

            ..._getEventfromDay(selectedDay).map((Event event) => ListTile(
                  title: Text(
                    event.title,
                  ),
                  subtitle: Text(event.marca + " - " + event.tratamento),
                )),
            // SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     ActionChip(
            //       avatar: Icon(
            //         CupertinoIcons.backward_fill,
            //         size: 20,
            //       ),
            //       label: Text(
            //         'Deslize para ver meses anteriores',
            //         style: AppTextStyles.labelBold,
            //       ),
            //       backgroundColor: AppColors.white,
            //       onPressed: () {},
            //     )
            //   ],
            // ),
            FloatingActionButton.extended(
              label: Text("Adicionar marcação"),
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(content: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                        return SizedBox(
                          height: 450,
                          child: SingleChildScrollView(
                            child: Container(
                              child: Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Nome do produto:",
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
                                            EdgeInsets.fromLTRB(18, 8, 18, 8),
                                        //labelText: '​E-mail',
                                        hintText: "Nome do produto utilizado",
                                        filled: true,
                                        fillColor: AppColors.white,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.zero),
                                      ),
                                      controller: _eventController,
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Informe um valor válido";
                                        }
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Marca do produto:",
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
                                            EdgeInsets.fromLTRB(18, 8, 18, 8),
                                        //labelText: '​E-mail',
                                        hintText: "Marca do produto utilizado",
                                        filled: true,
                                        fillColor: AppColors.white,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.zero),
                                      ),
                                      controller: _marcaController,
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Informe um valor válido";
                                        }
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Etapa do cronograma:",
                                      textAlign: TextAlign.left,
                                      style: AppTextStyles.labelBold,
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: RadioListTile(
                                                  title: Text("Hidratação"),
                                                  value: 0,
                                                  groupValue: _estagio,
                                                  onChanged: (int escolha) {
                                                    setState(() {
                                                      _estagio = escolha;
                                                    });
                                                  }),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: RadioListTile(
                                                  title: Text("Nutrição"),
                                                  value: 1,
                                                  groupValue: _estagio,
                                                  onChanged: (int escolha) {
                                                    setState(() {
                                                      _estagio = escolha;
                                                    });
                                                  }),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: RadioListTile(
                                                  title: Text("Reconstrução"),
                                                  value: 2,
                                                  groupValue: _estagio,
                                                  onChanged: (int escolha) {
                                                    setState(() {
                                                      _estagio = escolha;
                                                    });
                                                  }),
                                            )
                                          ],
                                        ),
                                        // ignore: deprecated_member_use
                                        RaisedButton(
                                          onPressed: () {
                                            _adicionarEvento();
                                            if (_eventController.text.isEmpty) {
                                            } else {
                                              if (selectedEvents[selectedDay] !=
                                                  null) {
                                                selectedEvents[selectedDay].add(
                                                  Event(
                                                    title:
                                                        _eventController.text,
                                                    marca:
                                                        _marcaController.text,
                                                    tratamento:
                                                        _tratamentoController
                                                            .text,
                                                  ),
                                                );
                                              } else {
                                                selectedEvents[selectedDay] = [
                                                  Event(
                                                      title:
                                                          _eventController.text,
                                                      marca:
                                                          _marcaController.text,
                                                      tratamento:
                                                          _tratamentoController
                                                              .text)
                                                ];
                                              }
                                            }
                                            // Navigator.pop(context);
                                            _eventController.clear();
                                            _marcaController.clear();
                                            // _tratamentoController.clear();
                                            setState(() {});

                                            Navigator.pop(context);

                                            return;
                                          },
                                          child: Text("Adicionar"),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }))),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

//
// () => showDialog(
// context: context,
// builder: (context) => AlertDialog(
// title: Text("Add Event"),
// content: Container(
// child: Column(
// children: [
// TextField(
// decoration: InputDecoration(
// hintText: "Nome do Produto"),
// controller: _nomeProdutoController,
// ),
// TextField(
// decoration: InputDecoration(
// hintText: "Marca do Produto"),
// controller: _marcaController,
// ),
// Column(
// children: <Widget>[
// Row(
// children: <Widget>[
// Expanded(
// flex: 1,
// child: RadioListTile(
// title: Text("Hidratação"),
// value: 0,
// groupValue:
// _estagio,
// onChanged: (int escolha) {
// setState(() {
// _estagio =
// escolha;
// });
// }),
// )
// ],
// ),
// Row(
// children: <Widget>[
// Expanded(
// flex: 1,
// child: RadioListTile(
// title: Text("Nutrição"),
// value: 1,
// groupValue:
// _estagio,
// onChanged: (int escolha) {
// setState(() {
// _estagio =
// escolha;
// });
// }),
// )
// ],
// ),
// Row(
// children: <Widget>[
// Expanded(
// flex: 1,
// child: RadioListTile(
// title: Text("Reconstrução"),
// value: 2,
// groupValue:
// _estagio,
// onChanged: (int escolha) {
// setState(() {
// _estagio =
// escolha;
// });
// }),
// )
// ],
// )
// ],
// ),
// ],
// ),
// ),
// actions: [
// TextButton(
// child: Text("Ok"),
// onPressed: () {
// print(_marcaController.text);
// if (_eventController.text.isEmpty) {
// } else {
// if (selectedEvents[selectedDay] != null) {
// selectedEvents[selectedDay].add(
// Event(
// title: _eventController.text,
// marca: _marcaController.text),
// );
// } else {
// selectedEvents[selectedDay] = [
// Event(
// title: _eventController.text,
// marca: _marcaController.text)
// ];
// }
// }
// Navigator.pop(context);
// _eventController.clear();
// _marcaController.clear();
// setState(() {});
// return;
// },
// ),
// TextButton(
// child: Text("Cancelar"),
// onPressed: () => Navigator.pop(context),
// ),
// ],
// )),