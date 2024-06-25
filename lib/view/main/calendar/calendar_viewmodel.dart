import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thekiddle_app/model/calendar_model.dart';

class CalendarViewModel extends BaseViewModel {
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  List<CalendarEvent> events = [
    CalendarEvent(title: "English Class", date: DateTime(2023, 12, 8), time: "8.00 am - 10.00 am", color: "#FFFF00"),
    CalendarEvent(title: "English Class", date: DateTime(2023, 12, 18), time: "8.00 am - 10.00 am", color: "#FFFF00"),
    CalendarEvent(title: "Meeting", date: DateTime(2023, 12, 18), time: "11.00 am - 12.00 pm", color: "#FFFF00"),
    CalendarEvent(title: "English Class", date: DateTime(2023, 12, 23), time: "8.00 am - 10.00 am", color: "#FFFF00"),
    CalendarEvent(title: "English Class", date: DateTime(2023, 12, 31), time: "8.00 am - 10.00 am", color: "#FFFF00"),
  ];

  List<CalendarEvent> nextSchedule = [
    CalendarEvent(title: "Science Class", date: DateTime(2023, 12, 20), time: "8.00 am - 10.00 am", color: "#D4E157"),
    CalendarEvent(title: "Science Class", date: DateTime(2023, 12, 21), time: "8.00 am - 10.00 am", color: "#FFF59D"),
    CalendarEvent(title: "Science Class", date: DateTime(2023, 12, 22), time: "8.00 am - 10.00 am", color: "#FFAB91"),
    CalendarEvent(title: "Science Class", date: DateTime(2023, 12, 23), time: "8.00 am - 10.00 am", color: "#CE93D8"),
  ];

  CalendarEvent? getEventForDay(int day) {
    return events.firstWhere(
      (event) => event.date.day == day,
      orElse: () => CalendarEvent(
        title: "No Event",
        date: DateTime(2023, 1, 1), // Arbitrary date
        time: "",
        color: "#FFFFFF", // Use a transparent color or default color
      ),
    );
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
