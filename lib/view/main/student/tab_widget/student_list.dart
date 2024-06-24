import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/student/student_viewmodel.dart';

class StudentListTab extends StatelessWidget {
  const StudentListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentViewModel>.reactive(
      viewModelBuilder: () => StudentViewModel(),
      builder: (context, model, child) {
        return Column(
          children: [
            _buildFilters(model),
            _buildOverallProgress(model),
            Expanded(child: _buildStudentList(model)),
          ],
        );
      },
    );
  }

  Widget _buildFilters(StudentViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton<String>(
          value: model.selectedClass,
          onChanged: (String? newValue) {
            model.updateSelectedClass(newValue);
          },
          items: model.classes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        DropdownButton<String>(
          value: model.selectedMonth,
          onChanged: (String? newValue) {
            model.updateSelectedMonth(newValue);
          },
          items: model.months.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildOverallProgress(StudentViewModel model) {
    return Row(
      children: [
        const Text('Student overall progress'),
        const SizedBox(width: 10),
        Expanded(
          child: LinearProgressIndicator(
            value: model.overallProgress / 100,
            backgroundColor: Colors.grey[300],
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 10),
        Text('${model.overallProgress}%'),
      ],
    );
  }

  Widget _buildStudentList(StudentViewModel model) {
    return ListView.builder(
      itemCount: model.students.length,
      itemBuilder: (context, index) {
        final student = model.students[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(student.imageUrl),
                    radius: 30,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Student's Name: ",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 12, // Smaller font size
                          ),
                          children: [
                            TextSpan(
                              text: student.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12, // Smaller font size
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: "Age: ",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 12, // Smaller font size
                          ),
                          children: [
                            TextSpan(
                              text: student.age.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12, // Smaller font size
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Start Day: ',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 12, // Smaller font size
                          ),
                          children: [
                            TextSpan(
                              text: student.startDate,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12, // Smaller font size
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Attendance: ',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 12, // Smaller font size
                          ),
                          children: [
                            TextSpan(
                              text: '${student.attendance}%', // Dynamic data
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12, // Smaller font size
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Homework: ',
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 12, // Smaller font size
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      '${student.homework}/30', // Dynamic data
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12, // Smaller font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildIconWithBackground(),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Test: ',
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 12, // Smaller font size
                              ),
                              children: [
                                TextSpan(
                                  text: '${student.test}%', // Dynamic data
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12, // Smaller font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildIconWithBackground(),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildIconWithBackground() {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: const BoxDecoration(
        color: Color(0xFFC1FF72),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.arrow_upward,
        size: 14.0,
        color: Colors.green,
      ),
    );
  }
}
