import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isEmailSelected = true;
  List<bool> isSelected = [true, false];

  void toggleIndex(int index) {
    isEmailSelected = index == 0;
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }
    notifyListeners();
  }

  void signIn(BuildContext context) {
    // Add your sign-in logic here
    // Navigate to the home page on successful sign-in
    Navigator.pushReplacementNamed(context, '/home-view');
  }

  void verificationCodeSignIn() {
    // Add your verification code sign-in logic here
  }

  void forgotPassword() {
    // Add your forgot password logic here
  }

  void contactUs() {
    // Add your contact us logic here
  }
}
