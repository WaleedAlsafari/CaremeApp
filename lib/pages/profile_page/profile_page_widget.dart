import 'package:Careme/db.dart';
import 'package:Careme/index.dart';
import 'package:Careme/pages/home_page/drawer.dart';
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

import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;
  bool _isName1 = true;
  bool _isName2 = true;
  bool _isPhone = true;
  bool _isEmailCorrect = true;
  bool _isPass = true;
  bool _isPasswordMatch = true;
  bool _isEmailUsed = false;
  bool _isEditingMode = false;
  bool _isPassChanged = false;
  DatabaseHelper dbHelper = DatabaseHelper();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

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
    _getProfileData();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void _getProfileData() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    User? user = await databaseHelper.getUserById(User.id);
    _model.firstName_Controller.text = user!.firstName;
    _model.lastName_Controller.text = user.lastName;
    _model.phoneNo_Controller.text = user.phoneNo;
    _model.email_Controller.text = user.email;
    _model.pass_Controller.text = user.pass;
  }

  void _setProfileData() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    User? user = await databaseHelper.getUserById(User.id);
    await databaseHelper.updateUser(User(
        firstName: _model.firstName_Controller.text,
        lastName: _model.lastName_Controller.text,
        gender: user!.gender,
        nationalId: user.nationalId,
        phoneNo: _model.phoneNo_Controller.text,
        email: _model.email_Controller.text,
        pass: _model.pass_Controller.text));
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2C75F0),
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_isEditingMode) {
            print('yes');
            bool complete = _isComplete();
            complete == true ? _save() : print('Error');
          } else {
            print('No');
            setState(() {
              _isEditingMode = !_isEditingMode;
            });
          }
        },
        child: _isEditingMode ? Icon(Icons.save) : Icon(Icons.edit),
        backgroundColor: _isComplete() ? Color(0xFF2C75F0) : Colors.grey,
      ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                  child: Text(
                    'Careme',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: Color(0xFF005AFF),
                          fontSize: 44,
                        ),
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
                          'Profile',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                    enabled: _isEditingMode ? true : false,
                    controller: _model.firstName_Controller,
                    focusNode: _model.textFieldFocusNode7,
                    autofocus: true,
                    autofillHints: [AutofillHints.name],
                    textCapitalization: TextCapitalization.none,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 22,
                          color: Color(0xFF2C75F0),
                          fontWeight: FontWeight.bold),
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
                          color: Color(0xFF2C75F0),
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
                    enabled: _isEditingMode ? true : false,
                    controller: _model.lastName_Controller,
                    focusNode: _model.textFieldFocusNode1,
                    autofocus: true,
                    autofillHints: [AutofillHints.name],
                    textCapitalization: TextCapitalization.none,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 22,
                          color: Color(0xFF2C75F0),
                          fontWeight: FontWeight.bold),
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
                          color: Color(0xFF2C75F0),
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
                    enabled: _isEditingMode ? true : false,
                    controller: _model.phoneNo_Controller,
                    focusNode: _model.textFieldFocusNode3,
                    autofocus: true,
                    autofillHints: [AutofillHints.telephoneNumberCountryCode],
                    textCapitalization: TextCapitalization.none,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 22,
                          color: Color(0xFF2C75F0),
                          fontWeight: FontWeight.bold),
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
                          color: Color(0xFF2C75F0),
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
                    enabled: _isEditingMode ? true : false,
                    controller: _model.email_Controller,
                    focusNode: _model.textFieldFocusNode4,
                    autofocus: true,
                    autofillHints: [AutofillHints.email],
                    textCapitalization: TextCapitalization.none,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 22,
                          color: Color(0xFF2C75F0),
                          fontWeight: FontWeight.bold),
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
                          color: Color(0xFF2C75F0),
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
                    enabled: _isEditingMode ? true : false,
                    controller: _model.pass_Controller,
                    focusNode: _model.textFieldFocusNode5,
                    autofocus: true,
                    textCapitalization: TextCapitalization.none,
                    obscureText: !_model.passwordVisibility1,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 22,
                          color: Color(0xFF2C75F0),
                          fontWeight: FontWeight.bold),
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
                          color: Color(0xFF2C75F0),
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
                        _isPassChanged = true;
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
                    enabled: _isEditingMode ? true : false,
                    controller: _isPassChanged
                        ? _model.ConfirmPass_Controller
                        : _model.pass_Controller,
                    focusNode: _model.textFieldFocusNode6,
                    autofocus: true,
                    textCapitalization: TextCapitalization.none,
                    obscureText: !_model.passwordVisibility2,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 22,
                          color: Color(0xFF2C75F0),
                          fontWeight: FontWeight.bold),
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
                          color: Color(0xFF2C75F0),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isComplete() {
    if ((_model.firstName_Controller.text != '' && _isName1) &&
        (_model.lastName_Controller.text != '' && _isName2) &&
        (_model.phoneNo_Controller.text != '' && _isPhone) &&
        (_model.email_Controller.text != '' && _isEmailCorrect) &&
        (_model.pass_Controller.text != '' && _isPass) &&
        (_isPasswordMatch)) return true;
    return false;
  }

  Future<bool> checkEmailUsed(email) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    User? user = await databaseHelper.getUserByEmail(email);

    if (user != null && user.nationalId != User.id) {
      return true;
    }
    return false;
  }

  void _save() async {
    if (await checkEmailUsed(_model.email_Controller.text) != true) {
      print('Hello');
      setState(() {
        _setProfileData();
        print(_model.firstName_Controller.text);
        _isEditingMode = !_isEditingMode;
      });
    } else {
      print('Hi');
      setState(() {
        _isEmailUsed = true;
      });
    }
  }
}
