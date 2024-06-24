import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thekiddle_app/view/auth/sign_in_view.dart';
import 'package:thekiddle_app/view/main/home/home_view.dart';
import 'package:thekiddle_app/view/main/payroll/payroll_view.dart';
import 'package:thekiddle_app/view/main/profile/profile_view.dart';
import 'package:thekiddle_app/view/main/replacement/addForm/replacement_request_view.dart';
import 'package:thekiddle_app/view/main/replacement/replacement_view.dart';
import 'package:thekiddle_app/view/main/student/student_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SignInView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: PayrollView),
    MaterialRoute(page: StudentView),
    MaterialRoute(page: ReplacementView),
    MaterialRoute(page: ReplacementRequestView),
    MaterialRoute(page: HomeView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetUp {}
