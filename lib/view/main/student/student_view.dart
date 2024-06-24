import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/student/student_viewmodel.dart';
import 'package:thekiddle_app/view/main/student/tab_widget/student_list.dart';
import 'package:thekiddle_app/view/main/student/tab_widget/student_progress.dart';
import 'package:thekiddle_app/view/main/student/tab_widget/student_attendance.dart'; // Import the new widget
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';
import 'package:thekiddle_app/widget/others/page_title.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentViewModel>.reactive(
      viewModelBuilder: () => StudentViewModel(),
      onModelReady: (model) {
        // Ensure that the selected values are part of the items list
        if (!model.classes.contains(model.selectedClass)) {
          model.updateSelectedClass(model.classes.first);
        }
        if (!model.months.contains(model.selectedMonth)) {
          model.updateSelectedMonth(model.months.first);
        }
      },
      builder: (context, model, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Header(),
            ),
            drawer: const DrawerView(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const PageTitle(title: 'Student'),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAE6E9),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Column(
                        children: [
                          TabBar(
                            labelColor: Colors.pink,
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Colors.pink,
                            tabs: [
                              Tab(text: 'Students list'),
                              Tab(text: 'Student progress'),
                              Tab(text: 'Student attendance'),
                            ],
                          ),
                          SizedBox(height: 4),
                          Expanded(
                            child: TabBarView(
                              children: [
                                StudentListTab(),
                                StudentProgressTab(),
                                StudentAttendanceTab(), // Use the new widget here
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
