import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Careme/flutter_flow/flutter_flow_theme.dart';
import 'package:Careme/pages/home_page/drawer.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2C75F0),
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
            child: Image.asset(
              'lib/icons/Careme-logos_transparent.png',
              alignment: Alignment.topCenter,
              height: 200,
              width: 200,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
              child: Text(
                'About us',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      fontSize: 26,
                      color: Color(0xFF2C75F0),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 15, 20, 0),
            child: RichText(
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'At \"Careme\", we\'re dedicated to reimagining healthcare. Our goal is simple: to provide convenient access to quality medical care, connecting you with professionals, appointments, and information effortlessly. With a user-friendly platform and a commitment to your well-being, we\'re here to make your health journey easier and more accessible.\"',
                    style: GoogleFonts.getFont(
                      'Lato',
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      fontSize: 22,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      lineHeight: 1.2,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
