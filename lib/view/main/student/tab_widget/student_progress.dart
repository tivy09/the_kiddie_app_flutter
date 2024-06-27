import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/student/student_viewmodel.dart';

class StudentProgressTab extends StatelessWidget {
  const StudentProgressTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentViewModel>.reactive(
      viewModelBuilder: () => StudentViewModel(),
      builder: (context, model, child) {
        return Column(
          children: [
            _buildFilters(model),
            const SizedBox(height: 16),
            _buildOverallProgress(model),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: model.students.length, // Using ViewModel data
                itemBuilder: (context, index) {
                  return _buildStudentProgressCard(model, index);
                },
              ),
            ),
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

  Widget _buildStudentProgressCard(StudentViewModel model, int index) {
    final student = model.students[index];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(student.imageUrl),
                  radius: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  student.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Progress photo'),
                Text('Attachment'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPlaceholderBox(Icons.camera_alt),
                _buildPlaceholderBox(Icons.attach_file),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title:',
                hintText: 'Insert caption:',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderBox(IconData icon) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFFFCE4E9),
      ),
      child: Center(
        child: Icon(icon, color: Colors.blue, size: 50),
      ),
    );
  }
}
