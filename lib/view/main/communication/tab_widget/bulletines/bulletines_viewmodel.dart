import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/model/conversation/bulletines_model.dart';

class BulletinViewModel extends BaseViewModel {
  List<Bulletin> _bulletins = [];

  List<Bulletin> get bulletins => _bulletins;

  void fetchBulletins() {
    // Fetch default data
    _bulletins = getDefaultBulletins();
    notifyListeners();
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
