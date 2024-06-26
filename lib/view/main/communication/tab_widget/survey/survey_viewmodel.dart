import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/model/conversation/survey_model.dart';

class SurveyViewModel extends BaseViewModel {
  bool isDetailView = false;
  Survey? selectedSurvey;

  String monthName(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month - 1];
  }

  String twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  String amPm(int hour) {
    return hour < 12 ? 'a.m.' : 'p.m.';
  }

  void showDetailView(Survey survey) {
    selectedSurvey = survey;
    isDetailView = true;
    notifyListeners();
  }

  void navigateToAddSurvey(BuildContext context) {
    // Handle navigation to add survey screen
  }
}
