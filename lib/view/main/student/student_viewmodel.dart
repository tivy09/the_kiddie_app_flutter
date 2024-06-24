import 'package:stacked/stacked.dart';

class StudentViewModel extends BaseViewModel {
  List<String> classes = ['Class A', 'Class B', 'Class C'];
  List<String> months = [
    'January 2023',
    'February 2023',
    'March 2023',
    'December 2023'
  ];

  String selectedClass = 'Class A';
  String selectedMonth = 'December 2023';
  int overallProgress = 65;
  List<bool> isSelected = [true, false, false];

  List<Student> students = [
    Student(
      name: 'Adrian',
      age: 6,
      startDate: '1 January 2022',
      attendance: 100,
      homework: 29,
      test: 100,
      imageUrl: '',
      className: 'Class 1',
    ),
    // Add more students here
    Student(
      name: 'Bella',
      age: 7,
      startDate: '15 March 2022',
      attendance: 90,
      homework: 25,
      test: 90,
      className: 'Class 1',
      imageUrl: '',
    ),
  ];

  void updateSelectedClass(String? newValue) {
    selectedClass = newValue ?? selectedClass;
    notifyListeners();
  }

  void updateSelectedMonth(String? newValue) {
    selectedMonth = newValue ?? selectedMonth;
    notifyListeners();
  }

  void updateToggleButtons(int index) {
    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
      isSelected[buttonIndex] = buttonIndex == index;
    }
    notifyListeners();
  }

  void addStudent(Student student) {
    students.add(student);
    notifyListeners();
  }

  void removeStudent(int index) {
    if (index >= 0 && index < students.length) {
      students.removeAt(index);
      notifyListeners();
    }
  }

  void updateStudent(int index, Student student) {
    if (index >= 0 && index < students.length) {
      students[index] = student;
      notifyListeners();
    }
  }
}

class Student {
  final String name;
  final int age;
  final String startDate;
  final int attendance;
  final int homework;
  final int test;
  final String imageUrl;
  final String? className;

  Student({
    required this.name,
    required this.age,
    required this.startDate,
    required this.attendance,
    required this.homework,
    required this.test,
    required this.imageUrl,
    this.className,
  });
}
