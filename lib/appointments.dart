class Appointment {
  var docFirstName;
  var docLastName;
  int id;
  var specialty;
  var selectedTime;
  var selectedDate;
  int appointmentNo;

  Appointment(
      {required this.id,
      required this.docFirstName,
      required this.docLastName,
      required this.specialty,
      required this.selectedTime,
      required this.selectedDate,
      required this.appointmentNo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'docFirstName': docFirstName,
      'docLastName': docLastName,
      'specialty': specialty,
      'selectedTime': selectedTime,
      'selectedDate': selectedDate,
      'appointmentNo': appointmentNo,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'],
      docFirstName: map['docFirstName'],
      docLastName: map['docLastName'],
      specialty: map['specialty'],
      selectedTime: map['selectedTime'],
      selectedDate: map['selectedDate'],
      appointmentNo: map['appointmentNo'],
    );
  }
}
