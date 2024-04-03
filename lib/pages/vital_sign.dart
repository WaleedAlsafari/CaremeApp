class VitalSign {
  int id;
  var weight;
  var height;
  var heartRate;
  var bloodSugar;
  var bloodPressure;
  var bloodType;
  var cholesterolLevels;

  VitalSign(
      {required this.id,
      required this.weight,
      required this.height,
      required this.heartRate,
      required this.bloodSugar,
      required this.bloodPressure,
      required this.bloodType,
      required this.cholesterolLevels});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weight': weight ?? '--',
      'height': height ?? '--',
      'heartRate': heartRate ?? '--',
      'bloodSugar': bloodSugar ?? '--',
      'bloodPressure': bloodPressure ?? '--',
      'bloodType': bloodType ?? '--',
      'cholesterolLevels': cholesterolLevels ?? '--',
    };
  }

  factory VitalSign.fromMap(Map<String, dynamic> map) {
    return VitalSign(
      id: map['id'],
      weight: map['weight'],
      height: map['height'],
      heartRate: map['heartRate'],
      bloodSugar: map['bloodSugar'],
      bloodPressure: map['bloodPressure'],
      bloodType: map['bloodType'],
      cholesterolLevels: map['cholesterolLevels'],
    );
  }
}
