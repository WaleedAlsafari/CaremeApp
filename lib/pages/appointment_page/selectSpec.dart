import 'package:flutter/material.dart';
import 'package:Careme/flutter_flow/flutter_flow_theme.dart';
import 'package:Careme/flutter_flow/flutter_flow_util.dart';
import 'package:Careme/pages/appointment_page/selectDoctor.dart';

class Specialization extends StatelessWidget {
  Specialization({Key? key});

  final List<String> specialties = [
    'Internal Medicine',
    'Dentistry',
    'Pediatrics',
    'Cardiology',
    'Neurology',
    'Dermatology',
    'Ophthalmology',
    'Orthopedics',
  ];

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
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Choose Specialization',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1,
                ),
                scrollDirection: Axis.vertical,
                itemCount: specialties.length,
                itemBuilder: (BuildContext context, int index) {
                  final specialty = specialties[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectDoctor(
                            specialty: specialty,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(44, 105, 209, 1),
                            Color.fromRGBO(67, 126, 226, 1),
                            Color.fromRGBO(108, 154, 231, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          specialty,
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1,
                                  ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
