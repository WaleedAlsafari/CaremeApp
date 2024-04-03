import '/flutter_flow/flutter_flow_util.dart';
import 'appointment_page_widget.dart' show AppointmentWidget, SchedulesWidget;
import 'package:flutter/material.dart';

class AppointmentsModel extends FlutterFlowModel<AppointmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
