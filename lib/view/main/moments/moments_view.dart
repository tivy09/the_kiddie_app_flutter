import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/moments/moments_viewmodel.dart';
import 'package:thekiddle_app/view/main/moments/tab_widget/all_moment_view.dart';
import 'package:thekiddle_app/view/main/moments/tab_widget/event_moment_view.dart';
import 'package:thekiddle_app/view/main/moments/tab_widget/lesson_moment_view.dart';
import 'package:thekiddle_app/view/main/moments/tab_widget/student_moment_view.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';
import 'package:thekiddle_app/widget/others/page_title.dart';

class MomentsView extends StatelessWidget {
  const MomentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MomentsViewModel>.reactive(
      viewModelBuilder: () => MomentsViewModel(),
      builder: (context, model, child) {
        return DefaultTabController(
          length: 4, // Ensure this matches the number of tabs
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Header(),
            ),
            drawer: const DrawerView(),
            body: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  PageTitle(title: 'Moments'),
                  SizedBox(height: 8),
                  TabBar(
                    labelColor: Colors.pink,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.pink,
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Students'),
                      Tab(text: 'Lesson'),
                      Tab(text: 'Events'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: TabBarView(
                      children: [
                        AllMomentsTab(),
                        StudentsMomentsTab(),
                        LessonMomentsTab(),
                        EventsMomentsTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                model.navigateToAddMomentForm(context);
              },
              backgroundColor: const Color(0xFFD1C4E9),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add_a_photo,
                color: Colors.black, // Set the icon color here
              ),
            ),
          ),
        );
      },
    );
  }
}
