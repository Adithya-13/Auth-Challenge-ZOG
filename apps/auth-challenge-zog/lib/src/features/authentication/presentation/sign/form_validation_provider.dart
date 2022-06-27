import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInValidationProvider extends ChangeNotifier {
  ValidationModel _password = ValidationModel(null, null);
  ValidationModel _username = ValidationModel(null, null);

  ValidationModel get password => _password;
  ValidationModel get username => _username;

  bool isObscure = true;
  bool isChecked = false;

  void onObscureTap() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void onCheckboxChanged(bool? value) {
    isChecked = value ?? false;
    notifyListeners();
  }

  void validatePassword(String? val) {
    if (val != null && val.isValidPassword) {
      _password = ValidationModel(val, null);
    } else {
      _password = ValidationModel(null, 'Password Minimum eight characters, at least one letter, one number and one special character');
    }
    notifyListeners();
  }

  void validateUsername(String? val) {
    if (val != null && val.isValidUsername) {
      _username = ValidationModel(val, null);
    } else {
      _username = ValidationModel(null, 'Please enter a valid username');
    }
    notifyListeners();
  }

  bool get validate {
    return _password.value != null && _username.value != null;
  }
}

class SignUpValidationProvider extends ChangeNotifier {
  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);
  ValidationModel _username = ValidationModel(null, null);

  ValidationModel get email => _email;
  ValidationModel get password => _password;
  ValidationModel get username => _username;

  bool isObscure = true;
  bool isChecked = false;

  void onObscureTap() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void onCheckboxChanged(bool? value) {
    isChecked = value ?? false;
    notifyListeners();
  }

  void validateEmail(String? val) {
    if (val != null && val.isValidEmail) {
      _email = ValidationModel(val, null);
    } else {
      _email = ValidationModel(null, 'Please Enter a Valid Email');
    }
    notifyListeners();
  }

  void validatePassword(String? val) {
    if (val != null && val.isValidPassword) {
      _password = ValidationModel(val, null);
    } else {
      _password = ValidationModel(null, 'Password Minimum eight characters, at least one letter, one number and one special character');
    }
    notifyListeners();
  }

  void validateUsername(String? val) {
    if (val != null && val.isValidUsername) {
      _username = ValidationModel(val, null);
    } else {
      _username = ValidationModel(null, 'Please enter a valid username');
    }
    notifyListeners();
  }

  bool get validate {
    return _email.value != null && _password.value != null && _username.value != null && isChecked == true;
  }
}

extension StringX on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidUsername {
    final nameRegExp = RegExp(r"^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$");
    return passwordRegExp.hasMatch(this);
  }
}

final signInValidationProvider = ChangeNotifierProvider.autoDispose<SignInValidationProvider>((ref) {
  return SignInValidationProvider();
});

final signUpValidationProvider = ChangeNotifierProvider.autoDispose<SignUpValidationProvider>((ref) {
  return SignUpValidationProvider();
});
