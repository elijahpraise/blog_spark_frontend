import 'dart:async';

import 'package:intl_phone_field/phone_number.dart';

class InputValidator {
  String? Function(String?) get name => (String? name) {
        if (name!.length < 3) {
          return "Name must be at least 3 characters";
        }
        return null;
      };

  String? Function(String?) get email => (String? email) {
        if (email!.isEmpty)
          return 'Please type in your email address';
        else if (!email.contains('@'))
          return 'Invalid email address';
        else if (email.split('@')[0].isEmpty)
          return 'Invalid email address';
        else if (email.split('@')[1].isEmpty) return 'Invalid email address';
        return null;
      };

  FutureOr<String?> Function(PhoneNumber?)? get phone =>
      (PhoneNumber? phoneNumber) {
        String phone = phoneNumber!.completeNumber;
        if (phone.isEmpty)
          return 'Please type in your phone number';
        else if (phone.length > 14)
          return 'Invalid phone number';
        else if (phone.length < 9) return "Invalid phone number";
        return null;
      };

  String? Function(dynamic) get gender => (dynamic gender) {
        if (gender == null) return "Please select a gender";
        return null;
      };

  String? Function(String?) get password => (String? password) {
        if (password!.isEmpty)
          return 'Please type in a password';
        else if (password.length < 8)
          return 'Password must be at least 8 characters';
        else if (!password.contains(RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+"))) {
          return 'Password must contain upper and lower lettercase';
        } else if (!password.contains(RegExp(r"[0-9_~`!@#$%^&*()_?.=-]"))) {
          return 'Password must contain symbol or number';
        }
        return null;
      };
}
