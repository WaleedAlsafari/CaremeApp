import 'dart:ffi';

import 'package:Careme/pages/sign_up/addtional_info.dart';
import 'package:Careme/db.dart';
import 'package:Careme/pages/sign_up/addtional_info.dart';
import 'package:Careme/users.dart';
import 'package:sqflite/sqflite.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import 'sign_up_model.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late SignUpModel _model;
  bool _isName1 = true;
  bool _isName2 = true;
  bool _isID = true;
  bool _isPhone = true;
  bool _isEmailCorrect = true;
  bool _isPass = true;
  bool _isPasswordMatch = true;
  bool _isEmailUsed = false;
  DatabaseHelper dbHelper = DatabaseHelper();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    _model.lastName_Controller ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.nationalId_Controller ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.phoneNo_Controller ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
    _model.email_Controller ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();
    _model.pass_Controller ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();
    _model.ConfirmPass_Controller ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();
    _model.firstName_Controller ??= TextEditingController();
    _model.textFieldFocusNode7 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: 801,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                    child: Image.asset(
                      'lib/icons/Careme-logos_transparent.png',
                      alignment: Alignment.topCenter,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, -1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 34,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 30, 24, 0),
                    child: TextFormField(
                      controller: _model.firstName_Controller,
                      focusNode: _model.textFieldFocusNode7,
                      autofocus: true,
                      autofillHints: [AutofillHints.name],
                      textCapitalization: TextCapitalization.none,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                        alignLabelWithHint: false,
                        hintText: 'First Name',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF005AFF),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorText: _isName1 ? null : 'Name is not correct!',
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                      minLines: 1,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          _isName1 = isAlpha(value);
                        });
                      },
                      validator:
                          _model.textController7Validator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 30, 24, 0),
                    child: TextFormField(
                      controller: _model.lastName_Controller,
                      focusNode: _model.textFieldFocusNode1,
                      autofocus: true,
                      autofillHints: [AutofillHints.name],
                      textCapitalization: TextCapitalization.none,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                        alignLabelWithHint: false,
                        hintText: 'Last Name',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF005AFF),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorText: _isName2 ? null : 'Name is not correct!',
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                      minLines: 1,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          _isName2 = isAlpha(value);
                        });
                      },
                      validator:
                          _model.textController1Validator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 30, 24, 0),
                    child: TextFormField(
                      controller: _model.nationalId_Controller,
                      focusNode: _model.textFieldFocusNode2,
                      autofocus: true,
                      textCapitalization: TextCapitalization.none,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                        alignLabelWithHint: false,
                        hintText: 'National ID',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF005AFF),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorText:
                            _isID ? null : 'National ID is not completed!',
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          value.length == 10 ? _isID = true : _isID = false;
                        });
                      },
                      validator:
                          _model.textController2Validator.asValidator(context),
                      inputFormatters: [_model.textFieldMask2],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 30, 24, 0),
                    child: TextFormField(
                      controller: _model.phoneNo_Controller,
                      focusNode: _model.textFieldFocusNode3,
                      autofocus: true,
                      autofillHints: [AutofillHints.telephoneNumberCountryCode],
                      textCapitalization: TextCapitalization.none,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                        alignLabelWithHint: false,
                        hintText: 'Phone Number',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF005AFF),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorText:
                            _isPhone ? null : 'Phone number is not correct!',
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _isPhone = isLength(value, 16);
                        });
                      },
                      validator:
                          _model.textController3Validator.asValidator(context),
                      inputFormatters: [_model.textFieldMask3],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 30, 24, 0),
                    child: TextFormField(
                      controller: _model.email_Controller,
                      focusNode: _model.textFieldFocusNode4,
                      autofocus: true,
                      autofillHints: [AutofillHints.email],
                      textCapitalization: TextCapitalization.none,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                        alignLabelWithHint: false,
                        hintText: 'Email',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF005AFF),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorText: _isEmailCorrect
                            ? (_isEmailUsed ? 'The Email is used!' : null)
                            : 'The Email is not valid',
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) async {
                        bool check = await checkEmailUsed(value);
                        setState(() {
                          _isEmailCorrect = isEmail(value);
                          _isEmailUsed = check;
                        });
                      },
                      validator:
                          _model.textController4Validator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 30, 24, 0),
                    child: TextFormField(
                      controller: _model.pass_Controller,
                      focusNode: _model.textFieldFocusNode5,
                      autofocus: true,
                      textCapitalization: TextCapitalization.none,
                      obscureText: !_model.passwordVisibility1,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                        alignLabelWithHint: false,
                        hintText: 'Password',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF005AFF),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorText: _isPass
                            ? null
                            : 'Password must be 8-16 characters and start with capital letter!',
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => _model.passwordVisibility1 =
                                !_model.passwordVisibility1,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.passwordVisibility1
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                      onChanged: (value) {
                        setState(() {
                          _isPass = value.startsWith(RegExp('[A-Z]')) &&
                              value.length >= 8 &&
                              value.length <= 16;
                        });
                      },
                      validator:
                          _model.textController5Validator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 30, 24, 0),
                    child: TextFormField(
                      controller: _model.ConfirmPass_Controller,
                      focusNode: _model.textFieldFocusNode6,
                      autofocus: true,
                      textCapitalization: TextCapitalization.none,
                      obscureText: !_model.passwordVisibility2,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                        alignLabelWithHint: false,
                        hintText: 'Confirm Password',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF005AFF),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorText:
                            _isPasswordMatch ? null : "Password doesn't match!",
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => _model.passwordVisibility2 =
                                !_model.passwordVisibility2,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.passwordVisibility2
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                      onChanged: (value) {
                        setState(() {
                          _model.pass_Controller.text !=
                                  _model.ConfirmPass_Controller.text
                              ? _isPasswordMatch = false
                              : _isPasswordMatch = true;
                        });
                      },
                      validator:
                          _model.textController6Validator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: FFButtonWidget(
                      onPressed: _isComplete()
                          ? () async {
                              if (await checkEmailUsed(
                                      _model.email_Controller.text) !=
                                  true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddtionalInfo(
                                        fName: _model.firstName_Controller.text,
                                        lName: _model.lastName_Controller.text,
                                        id: int.parse(
                                            _model.nationalId_Controller.text),
                                        phoneNo: _model.phoneNo_Controller.text,
                                        email: _model.email_Controller.text,
                                        pass: _model.pass_Controller.text,
                                      ),
                                    ));
                              } else {
                                setState(() {
                                  _isEmailUsed = true;
                                });
                              }
                            }
                          : null,
                      text: 'Sign Up',
                      options: FFButtonOptions(
                        width: 245,
                        height: 48,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color(0xFF2C75F0),
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                ),
                        elevation: 3,
                        disabledColor: Colors.grey,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(35, 20, 0, 0),
                          child: Text(
                            'Have an accout?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 20, 0, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushReplacementNamed('Sign_In');
                            },
                            child: Text(
                              'Sign In',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF005AFF),
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ),
                      ],
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

  bool _isComplete() {
    if ((_isEmailCorrect && _model.email_Controller.text != '') &&
        (_model.firstName_Controller.text != '' && _isName1) &&
        (_model.lastName_Controller.text != '' && _isName2) &&
        (_model.nationalId_Controller.text != '' && _isID) &&
        (_model.phoneNo_Controller.text != '' && _isPhone) &&
        (_model.email_Controller.text != '' && _isEmailCorrect) &&
        (_model.pass_Controller.text != '' && _isPass) &&
        (_model.ConfirmPass_Controller.text != '' && _isPasswordMatch))
      return true;
    return false;
  }

  Future<bool> checkEmailUsed(email) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    User? user = await databaseHelper.getUserByEmail(email);

    if (user != null) {
      return true;
    }
    return false;
  }
}
