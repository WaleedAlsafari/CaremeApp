import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Careme/aboutUs_page.dart';
import 'package:Careme/db.dart';
import 'package:Careme/flutter_flow/flutter_flow_util.dart';
import 'package:Careme/pages/home_page/home_page_widget.dart';
import 'package:Careme/pages/profile_page/profile_page_widget.dart';
import 'package:Careme/users.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 23, 102, 181),
              ),
              child: Image.asset('lib/icons/Careme-logos.jpeg')),
          ListTile(
            onTap: () {
              context.pushReplacementNamed('HomePage');
            },
            hoverColor: Colors.grey,
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
          ),
          ListTile(
            onTap: () {
              context.pushReplacementNamed('ProfileWidget');
            },
            hoverColor: Colors.grey,
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
          ),
          ListTile(
            onTap: () {
              context.pushReplacementNamed('AboutUs');
            },
            hoverColor: Colors.grey,
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.info_outlined),
            title: Text(
              'About Us',
              style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
          ),
          ListTile(
            onTap: () async {
              context.pushReplacementNamed('Sign_In');
            },
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(
              Icons.exit_to_app,
            ),
            title: Text(
              'Sign out',
              style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
          ),
          SizedBox(
            height: 375,
          ),
          ListTile(
            onTap: () {
              final alert = AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () async {
                        DatabaseHelper databaseHelper = DatabaseHelper();
                        await databaseHelper.deleteUser(User.id);

                        context.pushReplacementNamed('Sign_In');
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
                title: Text('Delete Account'),
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
                            'Are sure you want to delete your \naccount?',
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
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(
              Icons.delete_forever,
              color: Color.fromRGBO(230, 0, 0, 0.6),
            ),
            title: Text(
              'Delete Account',
              style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
