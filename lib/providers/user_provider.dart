import 'package:blog_spark/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _username = "";
  String _firstname = "";
  String _lastname = "";
  String _email = "";
  String _gender = "";
  String _phoneNumber = "";
  String _password = "";
  String _image = "";
  User? _user;

  String get username => _username;
  String get firstname => _firstname;
  String get lastname => _lastname;
  String get email => _email;
  String get gender => _gender;
  String get phoneNumber => _phoneNumber;
  String get password => _password;
  String get image => _image;
  User? get user => _user;

  set setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  set setFirstname(String value) {
    _firstname = value;
    notifyListeners();
  }

  set setLastname(String value) {
    _lastname = value;
    notifyListeners();
  }

  set setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  set setGender(String value) {
    _gender = value;
    notifyListeners();
  }

  set setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  set setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  set setImage(String value) {
    _image = value;
    notifyListeners();
  }

  set setUser(Map<String, dynamic> value) {
    _user = User.fromMap(value);
    notifyListeners();
  }
}
