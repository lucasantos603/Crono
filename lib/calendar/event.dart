import 'package:flutter/cupertino.dart';

class Event {
  final String title;
  final String marca;
  final String tratamento;

  Event(
      {@required this.title, @required this.marca, @required this.tratamento});
  String toStringTitle() => this.title;
  String toStringMarca() => this.marca;
  String toStringTratamento() => this.tratamento;
}
