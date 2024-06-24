import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/home/home_view.dart';
import 'package:thekiddle_app/view/main/notification/notification_view.dart';
import 'package:thekiddle_app/view/main/payroll/payroll_view.dart';
import 'package:thekiddle_app/view/main/profile/profile_view.dart';
import 'package:thekiddle_app/view/main/replacement/replacement_view.dart';
import 'package:thekiddle_app/view/main/student/student_view.dart';

class DrawerViewModel extends BaseViewModel {
  int _notificationCount = 1;

  int get notificationCount => _notificationCount;

  void clearNotifications() {
    _notificationCount = 0;
    notifyListeners();
  }

  void navigateToDashboard(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
  }

  void navigateToProfile(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ProfileView()),
    );
  }

  void navigateToPayroll(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PayrollView()),
    );
  }

  void navigateToStudent(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StudentView()),
    );
  }

  void navigateToReplacement(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ReplacementView()),
    );
  }

  void navigateToNotification(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const NotificationView()),
    );
  }
}
