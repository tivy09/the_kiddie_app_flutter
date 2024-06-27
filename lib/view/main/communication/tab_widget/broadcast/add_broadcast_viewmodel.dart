import 'package:stacked/stacked.dart';

class AddBroadcastViewModel extends BaseViewModel {
  DateTime? _selectedPublishedDate;
  DateTime? get selectedPublishedDate => _selectedPublishedDate;

  DateTime? _selectedActivityDate;
  DateTime? get selectedActivityDate => _selectedActivityDate;

  String? _selectedLearningArea;
  String? get selectedLearningArea => _selectedLearningArea;

  String? _selectedAlbum;
  String? get selectedAlbum => _selectedAlbum;

  String? _selectedStudents;
  String? get selectedStudents => _selectedStudents;

  final List<String> _learningAreas = ['Math', 'Science', 'Language'];
  List<String> get learningAreas => _learningAreas;

  final List<String> _albums = ['Album 1', 'Album 2', 'Album 3'];
  List<String> get albums => _albums;

  final List<String> _students = ['Student 1', 'Student 2', 'Student 3'];
  List<String> get students => _students;

  void setPublishedDate(DateTime date) {
    _selectedPublishedDate = date;
    notifyListeners();
  }

  void setActivityDate(DateTime date) {
    _selectedActivityDate = date;
    notifyListeners();
  }

  void setLearningArea(String area) {
    _selectedLearningArea = area;
    notifyListeners();
  }

  void setAlbum(String album) {
    _selectedAlbum = album;
    notifyListeners();
  }

  void setStudents(String students) {
    _selectedStudents = students;
    notifyListeners();
  }

  void sendBroadcast() {
    // Implement the logic to send the broadcast here.
    // You can use a service to handle the API call.
    print('Broadcast sent');
    // Example:
    // BroadcastService.sendBroadcast(
    //   title: _titleController.text,
    //   body: _bodyController.text,
    //   attachments: _attachments,
    //   recipients: _selectedRecipients,
    // );
  }

  void uploadMoment() {
    // Implement the logic to upload the moment here.
    // You can use a service to handle the API call.
    print('Moment uploaded');
  }
}
