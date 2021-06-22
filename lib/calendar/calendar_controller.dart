import 'package:flutter/foundation.dart';

class CalendarController {
  final currentPageNotifier = ValueNotifier<int>(0);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;
  int quantityRight = 0;
}
