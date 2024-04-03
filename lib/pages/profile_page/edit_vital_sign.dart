import 'package:flutter/material.dart';
import 'package:Careme/db.dart';
import 'package:Careme/flutter_flow/flutter_flow_util.dart';
import 'package:Careme/index.dart';
import 'package:Careme/pages/appointment_page/appointment_page_widget.dart';
import 'package:Careme/pages/profile_page/vitalSign_Page_widget.dart';
import 'package:Careme/pages/vital_sign.dart';
import 'package:Careme/users.dart';
import 'package:numberpicker/numberpicker.dart';

class EditVitalSign extends StatefulWidget {
  late var currentWeight;
  late var currentHeight;
  late var currentHeartRate;
  late var currentBloodSugar;
  late var currentBloodPressure;
  late var currentBloodType;
  late var currentCholestrolLevel;

  EditVitalSign(
      {super.key,
      this.currentHeight,
      this.currentHeartRate,
      this.currentBloodSugar,
      this.currentBloodPressure,
      this.currentBloodType,
      this.currentCholestrolLevel,
      this.currentWeight});

  @override
  State<EditVitalSign> createState() => _EditVitalSignState();
}

class _EditVitalSignState extends State<EditVitalSign> {
  @override
  void initState() {
    super.initState();
  }

  void _getVitalSign() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    VitalSign? vs = await databaseHelper.getVitalSignById(User.id);
    setState(() {
      widget.currentWeight = vs!.weight;
      widget.currentHeight = vs.height;
      widget.currentHeartRate = vs.heartRate;
      widget.currentBloodSugar = vs.bloodSugar;
      widget.currentBloodPressure = vs.bloodPressure;
      widget.currentBloodType = vs.bloodType;
      widget.currentCholestrolLevel = vs.cholesterolLevels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF2C75F0),
        onPressed: () async {
          DatabaseHelper databaseHelper = DatabaseHelper();
          await databaseHelper.updateVitalSign(VitalSign(
              id: User.id,
              weight: widget.currentWeight,
              height: widget.currentHeight,
              heartRate: widget.currentHeartRate,
              bloodSugar: widget.currentBloodSugar,
              bloodPressure: widget.currentBloodPressure,
              bloodType: widget.currentBloodType,
              cholesterolLevels: widget.currentCholestrolLevel));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageWidget(),
              ));
        },
        child: Icon(
          Icons.save_outlined,
          size: 32,
        ),
      ),
      appBar: AppBar(
        title: Text('Edit Vital Sign'),
        backgroundColor: Color(0xFF2C75F0),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weight:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${widget.currentWeight} ',
                style: TextStyle(
                    color: Color(0xFF2C75F0),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 3),
                child: Text(
                  'kg',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          NumberPicker(
            axis: Axis.horizontal,
            itemHeight: 50,
            itemWidth: 100,
            selectedTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C75F0),
            ),
            decoration: BoxDecoration(
                border: Border.all(
              width: 2,
              color: Color(0xFF2C75F0),
            )),
            value: widget.currentWeight,
            minValue: 0,
            maxValue: 500,
            onChanged: (value) => setState(() => widget.currentWeight = value),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Height:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${widget.currentHeight}',
                style: TextStyle(
                    color: Color(0xFF2C75F0),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 3),
                child: Text(
                  'cm',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          NumberPicker(
            axis: Axis.horizontal,
            itemHeight: 50,
            itemWidth: 100,
            selectedTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C75F0),
            ),
            decoration: BoxDecoration(
                border: Border.all(
              width: 2,
              color: Color(0xFF2C75F0),
            )),
            value: widget.currentHeight,
            minValue: 56,
            maxValue: 244,
            onChanged: (value) => setState(() => widget.currentHeight = value),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Heart Rate:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${widget.currentHeartRate == "--" ? 70 : widget.currentHeartRate}',
                style: TextStyle(
                    color: Color(0xFF2C75F0),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 3),
                child: Text(
                  'bpm',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          NumberPicker(
            axis: Axis.horizontal,
            itemHeight: 50,
            itemWidth: 100,
            selectedTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C75F0),
            ),
            decoration: BoxDecoration(
                border: Border.all(
              width: 2,
              color: Color(0xFF2C75F0),
            )),
            value:
                widget.currentHeartRate == '--' ? 70 : widget.currentHeartRate,
            minValue: 56,
            maxValue: 244,
            onChanged: (value) =>
                setState(() => widget.currentHeartRate = value),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BloodSugar:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${widget.currentBloodSugar == "--" ? 90 : widget.currentBloodSugar}',
                style: TextStyle(
                    color: Color(0xFF2C75F0),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 3),
                child: Text(
                  'mg/dL',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          NumberPicker(
            axis: Axis.horizontal,
            itemHeight: 50,
            itemWidth: 100,
            selectedTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C75F0),
            ),
            decoration: BoxDecoration(
                border: Border.all(
              width: 2,
              color: Color(0xFF2C75F0),
            )),
            value: widget.currentBloodSugar == '--'
                ? 90
                : widget.currentBloodSugar,
            minValue: 56,
            maxValue: 244,
            onChanged: (value) =>
                setState(() => widget.currentBloodSugar = value),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Blood Pressure:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${widget.currentBloodPressure == "--" ? 120 : widget.currentBloodPressure}',
                style: TextStyle(
                    color: Color(0xFF2C75F0),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 3),
                child: Text(
                  'mmHg',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          NumberPicker(
            axis: Axis.horizontal,
            itemHeight: 50,
            itemWidth: 100,
            selectedTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C75F0),
            ),
            decoration: BoxDecoration(
                border: Border.all(
              width: 2,
              color: Color(0xFF2C75F0),
            )),
            value: widget.currentBloodPressure == '--'
                ? 120
                : widget.currentBloodPressure,
            minValue: 56,
            maxValue: 244,
            onChanged: (value) =>
                setState(() => widget.currentBloodPressure = value),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cholestrol Levels:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${widget.currentCholestrolLevel == "--" ? 170 : widget.currentCholestrolLevel}',
                style: TextStyle(
                    color: Color(0xFF2C75F0),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 3),
                child: Text(
                  'mg/d',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          NumberPicker(
            axis: Axis.horizontal,
            itemHeight: 50,
            itemWidth: 100,
            selectedTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C75F0),
            ),
            decoration: BoxDecoration(
                border: Border.all(
              width: 2,
              color: Color(0xFF2C75F0),
            )),
            value: widget.currentCholestrolLevel == '--'
                ? 170
                : widget.currentCholestrolLevel,
            minValue: 56,
            maxValue: 244,
            onChanged: (value) =>
                setState(() => widget.currentCholestrolLevel = value),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Blood Type:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              DropdownButton(
                value: widget.currentBloodType == '--'
                    ? 'A+'
                    : widget.currentBloodType,
                alignment: Alignment.bottomCenter,
                borderRadius: BorderRadius.circular(12),
                dropdownColor: Color.fromARGB(255, 255, 255, 255),
                elevation: 2,
                style: TextStyle(
                  fontSize: 28,
                  color: Color(0xFF2C75F0),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text('A+'),
                    value: 'A+',
                  ),
                  DropdownMenuItem(
                    child: Text('A-'),
                    value: 'A-',
                  ),
                  DropdownMenuItem(
                    child: Text('B+'),
                    value: 'B+',
                  ),
                  DropdownMenuItem(
                    child: Text('B-'),
                    value: 'B-',
                  ),
                  DropdownMenuItem(
                    child: Text('O+'),
                    value: 'O+',
                  ),
                  DropdownMenuItem(
                    child: Text('O-'),
                    value: 'O-',
                  ),
                  DropdownMenuItem(
                    child: Text('AB+'),
                    value: 'AB+',
                  ),
                  DropdownMenuItem(
                    child: Text('AB-'),
                    value: 'AB-',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    widget.currentBloodType = value!;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
