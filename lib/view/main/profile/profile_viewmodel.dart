import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  String _firstName = '';
  String _lastName = '';
  String _emailAddress = '';
  DateTime? _dateOfBirth;
  String? _language = 'English';
  String _phoneNumber = '';
  String? _role = 'Teacher';
  String? _education = 'Bachelor';
  String _bio = '';

  int _currentIndex = 0;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get emailAddress => _emailAddress;
  DateTime? get dateOfBirth => _dateOfBirth;
  String? get language => _language;
  String get phoneNumber => _phoneNumber;
  String? get role => _role;
  String? get education => _education;
  String get bio => _bio;

  int get currentIndex => _currentIndex;

  void setFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  void setLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  void setEmailAddress(String value) {
    _emailAddress = value;
    notifyListeners();
  }

  void setDateOfBirth(DateTime? value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  void setLanguage(String? value) {
    _language = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setRole(String? value) {
    _role = value;
    notifyListeners();
  }

  void setEducation(String? value) {
    _education = value;
    notifyListeners();
  }

  void setBio(String value) {
    _bio = value;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void updateProfile() {
    // Handle profile update logic here
  }
}
