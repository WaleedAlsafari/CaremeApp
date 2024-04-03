import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:Careme/appointment_provider.dart';
import 'package:Careme/appointments.dart';
import 'package:Careme/db.dart';
import 'package:Careme/flutter_flow/flutter_flow_theme.dart';
import 'package:Careme/flutter_flow/flutter_flow_util.dart';
import 'package:Careme/flutter_flow/flutter_flow_widgets.dart';
import 'package:Careme/index.dart';
import 'package:Careme/users.dart';
import 'package:provider/provider.dart';
import 'package:Careme/pages/appointment_page/appointment_page_widget.dart';

class selectDateAndTime extends StatefulWidget {
  selectDateAndTime(
      {Key? key, this.specialty, this.docFirstName, this.docLastName});
  final appointmentWidget = AppointmentWidget();
  final docFirstName;
  final docLastName;
  final specialty;

  @override
  State<selectDateAndTime> createState() => _selectDateAndTimeState();
}

class _selectDateAndTimeState extends State<selectDateAndTime> {
  var _selectedTime;
  DateTime? _selectedDate = DateTime.now();
  bool _isSelected = false;

  List<String> _times = [
    '8:00 am',
    '8:15 am',
    '8:30 am',
    '8:45 am',
    '9:00 am',
    '9:15 am',
    '9:30 am',
    '9:45 am',
    '10:00 am',
    '10:15 am',
    '10:30 am',
    '10:45 am',
    '11:00 am',
    '11:15 am',
    '11:30 am',
    '11:45 am',
    '12:00 pm',
    '12:15 pm',
    '12:30 pm',
    '12:45 pm',
    '1:00 pm',
    '1:15 pm',
    '1:30 pm',
    '1:45 pm',
    '2:00 pm',
    '2:15 pm',
    '2:30 pm',
    '2:45 pm',
    '3:00 pm',
    '3:15 pm',
    '3:30 pm',
    '3:45 pm',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xDA1C61E8),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Choose Date and Time',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Select Day:',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                DatePicker(
                  DateTime.now(),
                  daysCount: 7,
                  initialSelectedDate: _selectedDate,
                  width: 80,
                  height: 100,
                  selectedTextColor: Colors.white,
                  selectionColor: Color.fromRGBO(44, 105, 209, 1),
                  dateTextStyle: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  dayTextStyle: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  monthTextStyle: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onDateChange: (selectedDate) {
                    setState(() {
                      _selectedDate = selectedDate;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 480,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: _times.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        overlayColor: MaterialStateProperty.all(Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        hoverColor: Colors.white,
                        onTap: () {
                          setState(() {
                            _selectedTime = _times[index];
                            _isSelected = true;
                          });
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                          decoration: BoxDecoration(
                            border: (_isSelected) &&
                                    (_selectedTime == _times[index])
                                ? Border.all(
                                    width: 2,
                                    color: Color.fromARGB(255, 5, 78, 172),
                                    strokeAlign: 1)
                                : null,
                            boxShadow: (_isSelected) &&
                                    (_selectedTime == _times[index])
                                ? null
                                : [
                                    BoxShadow(
                                      color: Colors.blueGrey,
                                      blurRadius: 3,
                                      blurStyle: BlurStyle.outer,
                                    )
                                  ],
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromRGBO(44, 105, 209, 1),
                          ),
                          child: Center(
                            child: Text(
                              _times[index],
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FFButtonWidget(
                  onPressed: () {
                    final alert = AlertDialog(
                      actions: [
                        TextButton(
                            onPressed: () async {
                              DatabaseHelper databaseHelper = DatabaseHelper();
                              databaseHelper.insertAppointment(Appointment(
                                  id: User.id,
                                  docFirstName: widget.docFirstName,
                                  docLastName: widget.docLastName,
                                  specialty: widget.specialty,
                                  selectedTime: _selectedTime,
                                  selectedDate: DateFormat('dd-MM-yy')
                                      .format(_selectedDate!)
                                      .toString(),
                                  appointmentNo: AppointmentWidget
                                      .appointmentList.length));

                              context.pushNamed('HomePage');
                            },
                            child: Text('Yes')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'No',
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                      title: Text('New Appointment'),
                      content: Container(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Divider(
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Confirm your appointment?',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => alert,
                    );
                  },
                  text: 'Book New Appointment',
                  options: FFButtonOptions(
                    width: 350,
                    height: 45,
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF2C75F0),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lato',
                          color: Colors.white,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
