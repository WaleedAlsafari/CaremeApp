import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'profile_page_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? lastName_Controller;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? nationalId_Controller;
  final textFieldMask2 = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? phoneNo_Controller;
  final textFieldMask3 = MaskTextInputFormatter(mask: '(+966) #########');
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? email_Controller;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? pass_Controller;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? ConfirmPass_Controller;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController6Validator;
  FocusNode? textFieldFocusNode7;
  TextEditingController? firstName_Controller;
  String? Function(BuildContext, String?)? textController7Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    lastName_Controller?.dispose();

    textFieldFocusNode2?.dispose();
    nationalId_Controller?.dispose();

    textFieldFocusNode3?.dispose();
    phoneNo_Controller?.dispose();

    textFieldFocusNode4?.dispose();
    email_Controller?.dispose();

    textFieldFocusNode5?.dispose();
    pass_Controller?.dispose();

    textFieldFocusNode6?.dispose();
    ConfirmPass_Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
