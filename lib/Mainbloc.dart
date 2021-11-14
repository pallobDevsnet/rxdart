// ignore_for_file: file_names

import 'package:rxdart/rxdart.dart';

class Mainbloc {
  int counter = 0;
  bool isExpanded = true;
  late BehaviorSubject counterController;
  late BehaviorSubject<bool> iconStateController = BehaviorSubject<bool>.seeded(isExpanded);
  Mainbloc() {
    counterController = BehaviorSubject<int>.seeded(counter);
  }

  void increment() {
    counter++;
    counterController.sink.add(counter);
  }

  void changeState() {
    if (isExpanded) {
      isExpanded = false;
    } else {
      isExpanded = true;
    }
    iconStateController.sink.add(isExpanded);
  }
}
