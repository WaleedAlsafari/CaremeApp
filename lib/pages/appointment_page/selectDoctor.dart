import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Careme/appointment_provider.dart';
import 'package:Careme/doctorInfo.dart';
import 'package:Careme/pages/appointment_page/selectDateAndTime.dart';
import 'package:provider/provider.dart';

class SelectDoctor extends StatefulWidget {
  SelectDoctor({this.specialty});

  final specialty;

  @override
  State<SelectDoctor> createState() => _SelectDoctorState();
}

class _SelectDoctorState extends State<SelectDoctor> {
  List<Doctor> doctors = [];
  List<Doctor> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    loadDoctors();
  }

  Future<void> loadDoctors() async {
    List<Doctor> fetchedDoctors =
        await Doctor.fetchDoctorsFromJsonFile('assets/doctors.json');
    setState(() {
      doctors = fetchedDoctors;
      filteredDoctors = doctors
          .where((doctor) => doctor.specialization == widget.specialty)
          .toList();
    });
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
          'Choose Doctor',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: filteredDoctors.length,
        itemBuilder: (context, index) {
          Doctor doctor = filteredDoctors[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => selectDateAndTime(
                          docFirstName: doctor.firstName,
                          docLastName: doctor.lastName,
                          specialty: doctor.specialization,
                        )),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue,
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(44, 105, 209, 1),
                    Color.fromRGBO(67, 126, 226, 1),
                    Color.fromRGBO(108, 154, 231, 1),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. ${doctor.firstName} ${doctor.lastName}',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
