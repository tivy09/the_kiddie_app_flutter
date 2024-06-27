import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/model/conversation/event_model.dart';

class EventViewModel extends BaseViewModel {
  List<Event> _events = [];

  List<Event> get events => _events;

  bool _isDetailView = false;
  Event? _selectedEvent;

  bool get isDetailView => _isDetailView;
  Event? get selectedEvent => _selectedEvent;

  void showEventDetail(Event event) {
    _selectedEvent = event;
    _isDetailView = true;
    notifyListeners();
  }

  void hideEventDetail() {
    _isDetailView = false;
    _selectedEvent = null;
    notifyListeners();
  }

  void fetchEvents() {
    // Fetch default data
    _events = getDefaultEvents();
    notifyListeners();
  }

  void navigateToAddEvent(BuildContext context) {
    // Navigate to add event screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddEventScreen()),
    );
  }

  String dayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  String monthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
      ),
      body: const Center(
        child: Text('Add Event Screen'),
      ),
    );
  }
}
