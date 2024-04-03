class User {
  String firstName;
  String lastName;
  String gender;
  int nationalId;
  String phoneNo;
  String email;
  String pass;

  static var id;
  User({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.nationalId,
    required this.phoneNo,
    required this.email,
    required this.pass,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'NationalId': nationalId,
      'phoneNo': phoneNo,
      'email': email,
      'pass': pass,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'],
      lastName: map['lastName'],
      gender: map['gender'],
      nationalId: map['nationalId'],
      phoneNo: map['phoneNo'],
      email: map['email'],
      pass: map['pass'],
    );
  }
}
