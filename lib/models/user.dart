class User {
  const User(
      {this.id,
      this.username,
      this.firstname,
      this.lastname,
      this.gender,
      this.phoneNumber,
      this.email,
      this.token,
      this.password,
      this.image});
  final int? id;
  final String? username;
  final String? firstname;
  final String? lastname;
  final String? gender;
  final String? token;
  final String? phoneNumber;
  final String? email;
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
    int id = map["id"];
    String token = map["token"];
    return User(
        id: id,
        username: username,
        firstname: firstname,
        lastname: lastname,
        gender: gender,
        token: token,
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
        "password": password
        // "image": image,
      };

  Map<String, dynamic> Function() get updateMap => () {
        Map<String, dynamic> data = map;
        data.forEach((key, value) {
          if (map[key] == null) {
            data.remove(key);
          }
        });
        return data;
      };

  Map<String, dynamic> get signInMap => {"email": email, "password": password};

  @override
  String toString() {
    return map.toString();
  }
}
