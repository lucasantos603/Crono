import 'dart:convert';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:CRONO/shared/widgets/button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
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

      setState(() {
        nome = snapshot['nome'].toString();
        ultimoResultado = snapshot['teste'].toString();
      });
    }
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
    initializeDateFormatting('pt_BR', null);
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
            SizedBox(height: 15),
            Text(
                "No seu último resultado do teste de porosidade o seu fio ${ultimoResultado}, siga a ordem de tratamento abaixo:"),
            ultimoResultado == 'Afundou Imediatamente'
                ? Image.asset(AppImages.cronogramaafundouimediamente,
                    fit: BoxFit.contain)
                : Text(""),
            ultimoResultado == 'Afundou Lentamente'
                ? Image.asset(AppImages.cronogramaafundoulentamente,
                    fit: BoxFit.contain)
                : Text(""),
            ultimoResultado == 'Boiou'
                ? Image.asset(AppImages.cronogramaboiou, fit: BoxFit.contain)
                : Text(""),
            SizedBox(height: 15),
            Text(
              "Cronograma atual:",
              style: AppTextStyles.body,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              child: TableCalendar(
                locale: 'pt-BR',
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
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: AppColors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedTextStyle: TextStyle(color: AppColors.white),
                  todayDecoration: BoxDecoration(
                    color: AppColors.black,
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
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(5.0)),
                    formatButtonTextStyle: TextStyle(
                      color: AppColors.white,
                    )),
              ),
            ),
            ..._getEventfromDay(selectedDay).map(
              (Event event) => ListTile(
                title: Text(
                  event.title + " - " + event.marca,
                  style: AppTextStyles.body,
                ),
                subtitle:
                    Text(event.tratamento, style: AppTextStyles.labelBold),
              ),
            ),
            FloatingActionButton.extended(
              label: Text("Adicionar marcação"),
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(content: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                        return SizedBox(
                          //height: 450,
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                                  title: Text("Hidratação",
                                                      style: AppTextStyles
                                                          .labelHidratacao),
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
                                                  title: Text(
                                                    "Nutrição",
                                                    style: AppTextStyles
                                                        .labelNutricao,
                                                  ),
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
                                                  title: Text(
                                                    "Reconstrução",
                                                    style: AppTextStyles
                                                        .labelReconstrucao,
                                                  ),
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
                                        SizedBox(height: 10),
                                        Text(
                                          "Preencha com atenção, não é possível alterar ou excluir a marcação posteriormente",
                                          textAlign: TextAlign.left,
                                          style: AppTextStyles.small,
                                        ),
                                        SizedBox(height: 30),
                                        ButtonWidget.green(
                                          label: "Adicionar",
                                          onTap: () {
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

                                            setState(() async {
                                              await Future.value({});
                                              _eventController.clear();
                                              _marcaController.clear();
                                              _tratamentoController.clear();
                                              Navigator.pop(context);
                                            });
                                            //setState(() {});

                                            return;
                                          },
                                        ),
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
