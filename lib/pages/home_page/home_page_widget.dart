import 'package:Careme/appointment_provider.dart';
import 'package:Careme/db.dart';
import 'package:Careme/doctorInfo.dart';
import 'package:Careme/pages/Profile_Page/Profile_page_widget.dart';
import 'package:Careme/pages/appointment_page/appointment_page_widget.dart';
import 'package:Careme/pages/appointment_page/selectDoctor.dart';
import 'package:Careme/pages/home_page/drawer.dart';
import 'package:Careme/pages/profile_page/vitalSign_Page_widget.dart';
import 'package:Careme/users.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({
    this.body,
    Key? key,
  });
  Widget? body;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  var _selectedTab = 0;
  var name;
  var doctors = <Doctor>[];
  Future<void> loadDoctors() async {
    List<Doctor> fetchedDoctors =
        await Doctor.fetchDoctorsFromJsonFile('assets/doctors.json');
    setState(() {
      doctors = fetchedDoctors;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    getName();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _tabs = [
      AppointmentWidget(),
      VitalSignPage(),
    ];
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
        appBar: AppBar(
          title: Text(
            'Hi, $name',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
          ),
          backgroundColor: Color(0xFF2C75F0),
        ),
        drawer: AppDrawer(),
        bottomNavigationBar: GNav(
          selectedIndex: _selectedTab,
          activeColor: Colors.white,
          hoverColor: Colors.lightBlue,
          color: Colors.grey,
          padding: EdgeInsets.all(15),
          //curve: Curves.easeIn,
          tabBackgroundColor: Color(0xFF2C75F0),
          tabMargin: EdgeInsets.all(10),
          tabBorderRadius: 30,
          onTabChange: (value) {
            setState(() {
              _selectedTab = value;
            });
          },
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              gap: 5,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
              gap: 5,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              onPressed: () => _tabs[_selectedTab],
            ),
          ],
        ),
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: _tabs[_selectedTab],
      ),
    );
  }

  void getName() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    User? user = await databaseHelper.getUserById(User.id);
    setState(() {
      name = user!.firstName;
    });
  }
}
