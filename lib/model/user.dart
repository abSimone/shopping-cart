class UserData {
   String? id;
  final String lastname;
  final String firstname;
  final String email;
  final String password;
  bool? isVendor = false;

  UserData(
      {this.id,
      required this.lastname,
      required this.firstname,
      required this.email,
      required this.password,
      this.isVendor});
}
