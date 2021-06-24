import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:CRONO/calendar/calendar_widget_bloc.dart';
import 'package:CRONO/calendar/Marcacao.dart';
import 'package:CRONO/shared/widgets/button_widget.dart';
import 'package:CRONO/views/bottomNavigationViews/default_page.dart';

class AddEventCalendar extends StatefulWidget {
  const AddEventCalendar({Key key}) : super(key: key);

  @override
  _AddEventCalendarState createState() => _AddEventCalendarState();
}

class _AddEventCalendarState extends State<AddEventCalendar> {
  TextEditingController _nomeProdutoController = TextEditingController();
  TextEditingController _marcaController = TextEditingController();
  String etapa = "Escolha";
  DateTime dateTime = DateTime.now();
  List<Meeting> meetings = <Meeting>[];

  Widget calendario(MeetingDataSource getCalendarDataSource) {
    _AddEventCalendarState addEvent = _AddEventCalendarState();
    getCalendarDataSource = this.getCalendarDataSource();

    return SizedBox(
        child: SfCalendar(
            view: CalendarView.month,
            dataSource: getCalendarDataSource,
            monthViewSettings: MonthViewSettings(
                appointmentDisplayMode:
                    MonthAppointmentDisplayMode.indicator)));
  }

  MeetingDataSource getCalendarDataSource(
      {String nomeProduto, String marca, String etapa, DateTime date}) {
    nomeProduto = this._nomeProdutoController.text;
    marca = this._marcaController.text;
    etapa = this.etapa;
    date = this.dateTime;

    if (etapa == "Hidratação") {
      meetings.add(Meeting(
          eventName: nomeProduto,
          from: date,
          to: dateTime.add(Duration(minutes: 5)),
          background: Colors.red,
          isAllDay: false));

      Marcacao marcacao = Marcacao();
      marcacao.nomeProduto = nomeProduto;
      marcacao.etapa = etapa;

      _adicionarEvento(marcacao);
    } else if (etapa == "Nutrição") {
      meetings.add(Meeting(
          eventName: nomeProduto,
          from: date,
          to: dateTime.add(Duration(minutes: 5)),
          background: Colors.green,
          isAllDay: false));
    } else if (etapa == "Restauração") {
      meetings.add(Meeting(
          eventName: nomeProduto,
          from: date,
          to: dateTime.add(Duration(minutes: 5)),
          background: Colors.blue,
          isAllDay: false));
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DefaultPage()));

    return MeetingDataSource(meetings);
  }

  _adicionarEvento(Marcacao marcacao) async {
    //Salvar dados do usuário
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    DocumentReference ref = await db.collection("marcacao").add({
      "nomeProduto": "${_nomeProdutoController.text}",
      "date": "${_controllerDate.text}",
      "etapa": "${etapa.toString()}",
      "usuario": auth.currentUser.uid
    });
  }

  TextEditingController _controllerDate = TextEditingController();
  TextEditingController _controllerEtapa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            textFiledNomeProduto(),
            textFiledMarca(),
            buildDatePicker(),
            dropdownButton(),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: ButtonWidget.green(
                label: "Adicionar",
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget textFiledNomeProduto() {
    return TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Digite o Nome do Produto Utilizado",
        ),
        onSubmitted: (String e) {
          print("valor digitado " + e);
        },
        controller: _nomeProdutoController);
  }

  Widget textFiledMarca() {
    return TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Digite o Nome da marca Utilizada",
        ),
        onSubmitted: (String e) {
          print("valor digitado " + e);
        },
        controller: _marcaController);
  }

  Widget buildDatePicker() {
    return SizedBox(
      height: 180,
      child: CupertinoDatePicker(
        //trocar se possivel
        initialDateTime: dateTime,
        mode: CupertinoDatePickerMode.dateAndTime,
        onDateTimeChanged: (dateTime) => setState(() {
          this.dateTime = dateTime;
          print(dateTime);
        }),
      ),
    );
  }

  Widget dropdownButton() {
    return SizedBox(
      width: 300,
      child: DropdownButton<String>(
        value: etapa,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.grey,
        ),
        onChanged: (String newValue) {
          setState(() {
            etapa = newValue;
          });
        },
        items: <String>['Escolha', 'Hidratação', 'Nutrição', 'Restauração']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
