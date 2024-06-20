import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  // Placeholder for class and date selections
  String selectedClass = 'Class';
  String selectedDate = 'December 2023';

  void updateClass(String newClass) {
    selectedClass = newClass;
    notifyListeners();
  }

  void updateDate(String newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  // Sample data for next schedule
  final List<Map<String, String>> nextSchedule = [
    {
      'title': 'Science Class',
      'time': '8.00 am - 10.00 am',
      'color': '0xFFC8E6C9'
    },
    {
      'title': 'Science Class',
      'time': '8.00 am - 10.00 am',
      'color': '0xFFFFF9C4'
    },
    {
      'title': 'Science Class',
      'time': '8.00 am - 10.00 am',
      'color': '0xFFFFCCBC'
    },
    {
      'title': 'Science Class',
      'time': '8.00 am - 10.00 am',
      'color': '0xFFBBDEFB'
    },
  ];
}
