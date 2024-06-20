import 'package:thekiddle_app/app/app.router.dart';

import '../../../../app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final String _declaration = 'Stacked is soo cool';
  String get myDeclaration => _declaration;
  final _navigationService = locator<NavigationService>();

  void navigateToSignIn() {
    _navigationService.navigateTo(Routes.signInView);
  }
}
