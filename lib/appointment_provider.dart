import 'package:flutter/foundation.dart';

class AppointmentProvider with ChangeNotifier {
  List list = [];

  void addAppointment(var docFirstName) {
    list.add(docFirstName);
    notifyListeners();
  }

  void deleteAppointment(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}
