import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:CRONO/core/core.dart';
import 'package:CRONO/views/teste/teste_porosidade_page.dart';
import 'package:CRONO/views/teste/teste_porosidade_pare_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarWidgetBloc {
  MeetingDataSource getCalendarDataSource(String resultado) {
    List<Meeting> meetings = <Meeting>[];
    print(resultado);

    if (resultado == "Boiou") {
      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now(),
          to: DateTime.now().add(Duration(days: 5)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Nutrição',
          from: DateTime.now().add(Duration(days: 6)),
          to: DateTime.now().add(Duration(days: 7)),
          background: AppColors.nutricao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 8)),
          to: DateTime.now().add(Duration(days: 10)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Nutrição',
          from: DateTime.now().add(Duration(days: 11)),
          to: DateTime.now().add(Duration(days: 12)),
          background: AppColors.nutricao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 13)),
          to: DateTime.now().add(Duration(days: 18)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 19)),
          to: DateTime.now().add(Duration(days: 21)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 22)),
          to: DateTime.now().add(Duration(days: 24)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 25)),
          to: DateTime.now().add(Duration(days: 26)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 27)),
          to: DateTime.now().add(Duration(days: 30)),
          background: AppColors.hidratacao,
          isAllDay: true));

      return MeetingDataSource(meetings);
    } else if (resultado == "Afundou Lentamente") {
      //Foco na nutrição
      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now(),
          to: DateTime.now().add(Duration(days: 2)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Nutrição',
          from: DateTime.now().add(Duration(days: 3)),
          to: DateTime.now().add(Duration(days: 5)),
          background: AppColors.nutricao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 6)),
          to: DateTime.now().add(Duration(days: 7)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 8)),
          to: DateTime.now().add(Duration(days: 10)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 11)),
          to: DateTime.now().add(Duration(days: 11)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Nutrição',
          from: DateTime.now().add(Duration(days: 12)),
          to: DateTime.now().add(Duration(days: 14)),
          background: AppColors.nutricao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 15)),
          to: DateTime.now().add(Duration(days: 16)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Nutrição',
          from: DateTime.now().add(Duration(days: 17)),
          to: DateTime.now().add(Duration(days: 18)),
          background: AppColors.nutricao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 19)),
          to: DateTime.now().add(Duration(days: 21)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 22)),
          to: DateTime.now().add(Duration(days: 23)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Nutrição',
          from: DateTime.now().add(Duration(days: 24)),
          to: DateTime.now().add(Duration(days: 26)),
          background: AppColors.nutricao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Reconstrução',
          from: DateTime.now().add(Duration(days: 27)),
          to: DateTime.now().add(Duration(days: 30)),
          background: AppColors.reconstrucao,
          isAllDay: true));
      return MeetingDataSource(meetings);
    } else if (resultado == "Afundou Imediatamente") {
      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now(),
          to: DateTime.now().add(Duration(days: 2)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Nutrição',
          from: DateTime.now().add(Duration(days: 3)),
          to: DateTime.now().add(Duration(days: 5)),
          background: AppColors.nutricao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Reconstrução',
          from: DateTime.now().add(Duration(days: 6)),
          to: DateTime.now().add(Duration(days: 7)),
          background: AppColors.reconstrucao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 8)),
          to: DateTime.now().add(Duration(days: 10)),
          background: AppColors.nutricao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 11)),
          to: DateTime.now().add(Duration(days: 11)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 12)),
          to: DateTime.now().add(Duration(days: 14)),
          background: AppColors.nutricao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 15)),
          to: DateTime.now().add(Duration(days: 16)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Nutrição',
          from: DateTime.now().add(Duration(days: 17)),
          to: DateTime.now().add(Duration(days: 18)),
          background: AppColors.nutricao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Reconstrução',
          from: DateTime.now().add(Duration(days: 19)),
          to: DateTime.now().add(Duration(days: 21)),
          background: AppColors.reconstrucao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 22)),
          to: DateTime.now().add(Duration(days: 23)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Hidratação',
          from: DateTime.now().add(Duration(days: 24)),
          to: DateTime.now().add(Duration(days: 26)),
          background: AppColors.hidratacao,
          isAllDay: true));

      meetings.add(Meeting(
          eventName: 'Nutrição',
          from: DateTime.now().add(Duration(days: 27)),
          to: DateTime.now().add(Duration(days: 30)),
          background: AppColors.nutricao,
          isAllDay: true));

      return MeetingDataSource(meetings);
    }
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

class Meeting {
  Meeting(
      {this.eventName = '',
      this.from,
      this.to,
      this.background,
      this.isAllDay = false});

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
