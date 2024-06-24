import 'package:stacked/stacked.dart';

class ReplacementRequestViewModel extends BaseViewModel {
  String _selectedLesson = 'English';
  String _selectedSchedule = '18/12/2023 8.00 AM';
  String _selectedPreferredDate = '25/12/2023 8.00 AM';
  String _selectedReason = 'Sick Leave';
  String _selectedClass = 'K 2019';

  List<String> get lessons => ['English', 'Math', 'Science'];
  List<String> get schedules => ['18/12/2023 8.00 AM', '19/12/2023 10.00 AM'];
  List<String> get preferredDates =>
      ['25/12/2023 8.00 AM', '26/12/2023 10.00 AM'];
  List<String> get reasons => ['Sick Leave', 'Personal', 'Emergency'];
  List<String> get classes => ['K 2019', 'K 2020', 'K 2021'];

  String get selectedLesson => _selectedLesson;
  String get selectedSchedule => _selectedSchedule;
  String get selectedPreferredDate => _selectedPreferredDate;
  String get selectedReason => _selectedReason;
  String get selectedClass => _selectedClass;

  void setSelectedLesson(String lesson) {
    _selectedLesson = lesson;
    notifyListeners();
  }

  void setSelectedSchedule(String schedule) {
    _selectedSchedule = schedule;
    notifyListeners();
  }

  void setSelectedPreferredDate(String date) {
    _selectedPreferredDate = date;
    notifyListeners();
  }

  void setSelectedReason(String reason) {
    _selectedReason = reason;
    notifyListeners();
  }

  void setSelectedClass(String className) {
    _selectedClass = className;
    notifyListeners();
  }
}
