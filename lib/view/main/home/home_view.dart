import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/home/container_widget/attendance_container.dart';
import 'package:thekiddle_app/view/main/home/container_widget/communication_container.dart';
import 'package:thekiddle_app/view/main/home/container_widget/replacement_container.dart';
import 'package:thekiddle_app/view/main/home/container_widget/schedule_container.dart';
import 'package:thekiddle_app/view/main/home/home_viewmodel.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';
import 'package:thekiddle_app/widget/others/page_title.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Header(),
          ),
          drawer: const DrawerView(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const PageTitle(title: 'Dashboard'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      value: model.selectedClass,
                      onChanged: (String? newValue) {
                        model.updateClass(newValue!);
                      },
                      items: model.classes
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    DropdownButton<String>(
                      value: model.selectedDate,
                      onChanged: (String? newValue) {
                        model.updateDate(newValue!);
                      },
                      items: model.availableDates
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                NextScheduleContainer(model: model),
                const SizedBox(height: 16),
                const StudentAttendanceContainer(),
                const SizedBox(height: 16),
                ReplacementRequestContainer(model: model),
                const SizedBox(height: 16),
                const CommunicationsContainer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
