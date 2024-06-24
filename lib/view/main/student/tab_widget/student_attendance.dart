import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/student/student_viewmodel.dart';

class StudentAttendanceTab extends StatelessWidget {
  const StudentAttendanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentViewModel>.reactive(
      viewModelBuilder: () => StudentViewModel(),
      builder: (context, viewModel, child) {
        return ListView.builder(
          itemCount: viewModel.students.length,
          itemBuilder: (context, index) {
            final student = viewModel.students[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10.0,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 16.0),
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: student.imageUrl.isNotEmpty
                                ? NetworkImage(student.imageUrl)
                                : null,
                            child: student.imageUrl.isEmpty
                                ? const Icon(Icons.person, size: 30.0)
                                : null,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            student.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(student.startDate),
                          const SizedBox(height: 4.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text('Attendance'),
                                        const SizedBox(height: 4.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${student.attendance}%',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(width: 4.0),
                                            const Icon(
                                              Icons.arrow_upward,
                                              color: Colors.green,
                                              size: 16.0,
                                            ),
                                          ],
                                        ),
                                        Text('${student.homework} Days'),
                                      ],
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('Today'),
                                      SizedBox(height: 4.0),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          'available',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24.0,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      // Add logic for Absent button
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.grey,
                                      side:
                                          const BorderSide(color: Colors.grey),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 2.0,
                                      ),
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: const Text('Absent'),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add logic for Attended button
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF1CB603),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 2.0,
                                      ),
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: const Text(
                                      'Attended',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: PopupMenuButton<String>(
                        onSelected: (String result) {
                          // Handle the menu selection here
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'Option 1',
                            child: Text('Option 1'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Option 2',
                            child: Text('Option 2'),
                          ),
                        ],
                        icon: const Icon(Icons.more_vert),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
