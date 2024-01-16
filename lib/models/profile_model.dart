class ProfileModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? dateTime;
  final String? id;
  final String? packageType;

  ProfileModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.dateTime,
      required this.id,
      required this.packageType});

  factory ProfileModel.fromJson(jsonData) {
    return ProfileModel(
        firstName: jsonData['firstName'],
        lastName: jsonData['lastName'],
        email: jsonData['email'],
        password: jsonData['password'],
        id: jsonData['id'],
        dateTime: jsonData['dateTime'],
        packageType: jsonData['packageType']);
  }
}
