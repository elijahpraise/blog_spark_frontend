class User {
  const User(
      {required this.username,
      required this.firstname,
      required this.lastname,
      required this.gender,
      required this.phoneNumber,
      required this.email,
      this.password,
      this.image});
  final String username;
  final String firstname;
  final String lastname;
  final String gender;
  final String phoneNumber;
  final String email;
  final String? image;
  final String? password;

  factory User.fromMap(Map<String, dynamic> map) {
    String username = map["username"];
    String firstname = map["first_name"];
    String lastname = map["last_name"];
    String gender = map["gender"];
    String phoneNumber = map["phone_number"];
    String email = map["email"];
    String? image = map["image"];
    return User(
        username: username,
        firstname: firstname,
        lastname: lastname,
        gender: gender,
        phoneNumber: phoneNumber,
        email: email,
        image: image);
  }

  Map<String, dynamic> get map => {
        "username": username,
        "first_name": firstname,
        "last_name": lastname,
        "gender": gender,
        "phone_number": phoneNumber,
        "email": email,
        "image": image,
        "password": password
      };

  @override
  String toString() {
    return map.toString();
  }
}
