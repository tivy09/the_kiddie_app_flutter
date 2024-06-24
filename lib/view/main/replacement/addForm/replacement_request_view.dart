import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/replacement/addForm/replacement_request_viewmodel.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';
import 'package:thekiddle_app/widget/others/page_title.dart';

class ReplacementRequestView extends StatelessWidget {
  const ReplacementRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReplacementRequestViewModel>.reactive(
      viewModelBuilder: () => ReplacementRequestViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Header(),
          ),
          drawer: const DrawerView(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: PageTitle(title: 'Request Class Change'),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 5.0, left: 16.0, right: 16.0, bottom: 10.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCE4EC),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Lesson'),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: model.selectedLesson,
                        onChanged: (value) {
                          model.setSelectedLesson(value!);
                        },
                        items: model.lessons.map((String lesson) {
                          return DropdownMenuItem<String>(
                            value: lesson,
                            child: Text(lesson),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xFFB5B5B5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Schedule'),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: model.selectedSchedule,
                        onChanged: (value) {
                          model.setSelectedSchedule(value!);
                        },
                        items: model.schedules.map((String schedule) {
                          return DropdownMenuItem<String>(
                            value: schedule,
                            child: Text(schedule),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xFFB5B5B5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Preferred Date'),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: model.selectedPreferredDate,
                        onChanged: (value) {
                          model.setSelectedPreferredDate(value!);
                        },
                        items: model.preferredDates.map((String date) {
                          return DropdownMenuItem<String>(
                            value: date,
                            child: Text(date),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xFFB5B5B5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Reason'),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: model.selectedReason,
                        onChanged: (value) {
                          model.setSelectedReason(value!);
                        },
                        items: model.reasons.map((String reason) {
                          return DropdownMenuItem<String>(
                            value: reason,
                            child: Text(reason),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xFFB5B5B5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Class'),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: model.selectedClass,
                        onChanged: (value) {
                          model.setSelectedClass(value!);
                        },
                        items: model.classes.map((String className) {
                          return DropdownMenuItem<String>(
                            value: className,
                            child: Text(className),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xFFB5B5B5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle submit request action
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFF3E97FF),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                              vertical: 12.0,
                            ),
                          ),
                          child: const Text('Submit Request'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
