import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thekiddle_app/view/auth/sign_in_view.dart';
import 'package:thekiddle_app/view/home/home_view.dart';
import 'package:thekiddle_app/view/profile/profile_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SignInView, initial: true),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetUp {}
