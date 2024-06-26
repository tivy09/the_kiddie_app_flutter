import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeViewModel extends BaseViewModel {
  // Existing properties
  String selectedClass = 'Class A';
  String selectedDate = '2024-06-26';
  List<String> classes = ['Class A', 'Class B', 'Class C'];
  List<String> availableDates = ['2024-06-26', '2024-06-27', '2024-06-28'];

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  List<Map<String, String>> nextSchedule = [
    {
      'title': 'Math Class',
      'time': '10:00 AM - 11:00 AM',
      'color': '0xFFB3E5FC',
    },
    {
      'title': 'Science Class',
      'time': '11:30 AM - 12:30 PM',
      'color': '0xFFB39DDB',
    },
  ];

  // New property for replacement requests
  List<Map<String, String>> replacementRequests = [
    {
      'status': 'Pending',
      'lesson': 'English',
      'submittedOn': '18/12/2023',
    },
    {
      'status': 'Pending',
      'lesson': 'English',
      'submittedOn': '18/12/2023',
    },
    {
      'status': 'Reject',
      'lesson': 'English',
      'submittedOn': '18/12/2023',
    },
    {
      'status': 'Approved',
      'lesson': 'English',
      'submittedOn': '18/12/2023',
    },
    {
      'status': 'Pending',
      'lesson': 'English',
      'submittedOn': '18/12/2023',
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

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay = selected;
    focusedDay = focused;
    notifyListeners();
  }

  void onFormatChanged(CalendarFormat format) {
    calendarFormat = format;
    notifyListeners();
  }
}
