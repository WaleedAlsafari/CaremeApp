import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Careme/appointments.dart';
import 'package:Careme/db.dart';
import 'package:Careme/pages/appointment_page/appointment_page_model.dart';
import 'package:Careme/pages/appointment_page/selectSpec.dart';
import 'package:Careme/users.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppointmentWidget extends StatefulWidget {
  AppointmentWidget({Key? key}) : super(key: key);

  static List<Appointment> appointmentList = [];

  @override
  _AppointmentWidgetState createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  late AppointmentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentsModel());
  }

  Future getAppoinments() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    List<Appointment> list = await databaseHelper.getAppointmentsById(User.id);
    setState(() {
      AppointmentWidget.appointmentList = list;
    });
  }

  Text userText = Text('No appointment found');
  Future<void> fetchUserData() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    User? user = await databaseHelper
        .getUserById(1118251527); // Replace '1' with the desired appointment ID

    if (user != null) {
      setState(() {
        userText = Text('User: ${user.firstName} ${user.lastName}\n'
            'ID: ${user.nationalId}\n'
            'phone: ${user.phoneNo}\n'
            'email: ${user.email}\n'
            'pass:  ${user.pass}');
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getAppoinments();
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppointmentWidget.appointmentList.length == 0
                      ? Column(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 0, 12),
                                child: FaIcon(
                                  FontAwesomeIcons.calendarTimes,
                                  color: Color(0x7157636C),
                                  size: 150,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 12, 12),
                                child: Text(
                                  'No Appointment',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 12, 30),
                                child: Text(
                                  'Book a new appointment now with our best specialists.',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: AppointmentWidget.appointmentList.length,
                            itemBuilder: buildAppointment,
                          ),
                        ),
                  SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Specialization()));
                        },
                        text: 'Book New Appointment',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 45,
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0xFF2C75F0),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAppointment(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onLongPress: () async {
          final alert = AlertDialog(
            actions: [
              TextButton(
                  onPressed: () async {
                    DatabaseHelper databaseHelper = DatabaseHelper();
                    databaseHelper.deleteAppointment(
                        AppointmentWidget.appointmentList[index].appointmentNo);
                    setState(() {
                      AppointmentWidget.appointmentList.removeAt(index);
                    });
                    Navigator.pop(context);
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
            title: Text('Delete Appointment'),
            content: Container(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Text(
                        'Are sure you want to delete your \nappointment?',
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
        child: Container(
          width: 100,
          height: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(44, 105, 209, 1),
                Color.fromRGBO(67, 126, 226, 1),
                Color.fromRGBO(108, 154, 231, 1),
              ],
              begin: AlignmentDirectional(1, 0),
              end: AlignmentDirectional(-1, 0),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Text(
                          AppointmentWidget.appointmentList[index].specialty,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Text(
                        AppointmentWidget.appointmentList[index].selectedTime,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.5,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dr. ${AppointmentWidget.appointmentList[index].docFirstName} ${AppointmentWidget.appointmentList[index].docLastName}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      AppointmentWidget.appointmentList[index].selectedDate,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
