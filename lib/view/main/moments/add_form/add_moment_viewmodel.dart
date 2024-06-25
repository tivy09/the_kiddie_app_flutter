import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class AddMomentViewModel extends BaseViewModel {
  // TextEditingController for input fields
  final TextEditingController publishedDateController = TextEditingController();
  final TextEditingController activityDateController = TextEditingController();
  final TextEditingController learningAreaController = TextEditingController();
  final TextEditingController albumController = TextEditingController();
  final TextEditingController studentsController = TextEditingController();

  // Selected values
  DateTime? selectedPublishedDate;
  DateTime? selectedActivityDate;
  String? selectedLearningArea;
  String? selectedAlbum;
  String? selectedStudents;

  // Dummy data for dropdowns
  final List<String> learningAreas = ['Math', 'Science', 'Art'];
  final List<String> albums = ['Album 1', 'Album 2', 'Album 3'];
  final List<String> students = ['Student 1', 'Student 2', 'Student 3'];

  get titleController => null;

  // Methods to set selected values
  void setPublishedDate(DateTime date) {
    selectedPublishedDate = date;
    publishedDateController.text = DateFormat.yMMMd().format(date);
    notifyListeners();
  }

  void setActivityDate(DateTime date) {
    selectedActivityDate = date;
    activityDateController.text = DateFormat.yMMMd().format(date);
    notifyListeners();
  }

  void setLearningArea(String learningArea) {
    selectedLearningArea = learningArea;
    learningAreaController.text = learningArea;
    notifyListeners();
  }

  void setAlbum(String album) {
    selectedAlbum = album;
    albumController.text = album;
    notifyListeners();
  }

  void setStudents(String students) {
    selectedStudents = students;
    studentsController.text = students;
    notifyListeners();
  }

  // Method to handle upload action
  void uploadMoment() {
    // Add upload logic here
  }

  @override
  void dispose() {
    // Dispose controllers when the ViewModel is disposed
    publishedDateController.dispose();
    activityDateController.dispose();
    learningAreaController.dispose();
    albumController.dispose();
    studentsController.dispose();
    super.dispose();
  }
}
