import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isEmailSelected = true;
  List<bool> isSelected = [true, false];

  void toggleIndex(int index) {
    if (index == 0) {
      isEmailSelected = true;
    } else {
      isEmailSelected = false;
    }
    isSelected = [isEmailSelected, !isEmailSelected];
    notifyListeners();
  }

  void signIn() {
    // Implement sign-in logic here
  }

  void verificationCodeSignIn() {
    // Implement verification code sign-in logic here
  }

  void forgotPassword() {
    // Implement forgot password logic here
  }

  void contactUs() {
    // Implement contact us logic here
  }
}
