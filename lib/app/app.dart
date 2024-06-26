import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thekiddle_app/view/auth/sign_in_view.dart';
import 'package:thekiddle_app/view/main/calendar/calendar_view.dart';
import 'package:thekiddle_app/view/main/communication/communication_view.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/broadcast/add_broadcast_view.dart';
import 'package:thekiddle_app/view/main/home/home_view.dart';
import 'package:thekiddle_app/view/main/moments/moments_view.dart';
import 'package:thekiddle_app/view/main/moments/add_form/add_moment_view.dart';
import 'package:thekiddle_app/view/main/notification/notification_view.dart';
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
    MaterialRoute(page: NotificationView),
    MaterialRoute(page: CalendarView),
    //Moment
    MaterialRoute(page: MomentsView),
    MaterialRoute(page: AddMomentView),
    //Communication
    MaterialRoute(page: CommunicationView),
    MaterialRoute(page: AddBroadcastView),
    MaterialRoute(page: HomeView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetUp {}
