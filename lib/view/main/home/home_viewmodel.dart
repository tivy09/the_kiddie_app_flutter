import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeViewModel extends BaseViewModel {
  String selectedClass = 'Class';
  String selectedDate = DateFormat.yMMMM().format(DateTime.now());
  List<String> classes = ['Class', 'Class 1', 'Class 2'];
  List<String> availableDates = [
    'December 2023',
    DateFormat.yMMMM().format(DateTime.now()),
  ];

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  List<Map<String, String>> nextSchedule = [
    {
      'title': 'Math Class',
      'time': '10:00 AM',
      'color': '0xFF90CAF9',
    },
    {
      'title': 'Science Class',
      'time': '12:00 PM',
      'color': '0xFFA5D6A7',
    },
  ];

  void updateClass(String newClass) {
    selectedClass = newClass;
    notifyListeners();
  }

  void updateDate(String newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay = selectedDay;
    this.focusedDay = focusedDay;
    notifyListeners();
  }

  void onFormatChanged(CalendarFormat format) {
    calendarFormat = format;
    notifyListeners();
  }
}
