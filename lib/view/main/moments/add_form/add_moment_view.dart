import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:thekiddle_app/view/main/moments/add_form/add_moment_viewmodel.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';
import 'package:thekiddle_app/widget/others/page_title.dart';

class AddMomentView extends StatelessWidget {
  const AddMomentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddMomentViewModel>.reactive(
      viewModelBuilder: () => AddMomentViewModel(),
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
                  padding: EdgeInsets.only(
                      top: 5.0, left: 16.0, right: 16.0, bottom: 10.0),
                  child: PageTitle(title: ' Moments'),
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
                      const Text(
                        'Upload Moments',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      GestureDetector(
                        onTap: () {
                          // Add image upload action here
                        },
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.blue.shade50,
                          child: Icon(Icons.add_photo_alternate,
                              size: 50, color: Colors.blue.shade200),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Set Published Date & Time',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildDateTimePicker(context, model,
                          model.selectedPublishedDate, model.setPublishedDate),
                      const SizedBox(height: 16),
                      const Text(
                        'Set Activity Date & Time',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildDateTimePicker(context, model,
                          model.selectedActivityDate, model.setActivityDate),
                      const SizedBox(height: 16),
                      const Text(
                        'Learning Area',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: model.selectedLearningArea,
                        onChanged: (value) {
                          model.setLearningArea(value!);
                        },
                        items: model.learningAreas.map((String area) {
                          return DropdownMenuItem<String>(
                            value: area,
                            child: Text(area),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 16.0), // Adjust padding here
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Add to Albums',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: model.selectedAlbum,
                        onChanged: (value) {
                          model.setAlbum(value!);
                        },
                        items: model.albums.map((String album) {
                          return DropdownMenuItem<String>(
                            value: album,
                            child: Text(album),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 16.0), // Adjust padding here
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Tag Students',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: model.selectedStudents,
                        onChanged: (value) {
                          model.setStudents(value!);
                        },
                        items: model.students.map((String student) {
                          return DropdownMenuItem<String>(
                            value: student,
                            child: Text(student),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 16.0), // Adjust padding here
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: model.uploadMoment,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFF73B1F7),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32.0,
                                vertical: 12.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust the radius to match the image
                              ),
                              elevation: 0, // Remove shadow if needed
                            ),
                            child: const Text(
                              'Upload',
                              style: TextStyle(
                                fontSize:
                                    18.0, // Adjust font size to match the image
                              ),
                            ),
                          ),
                        ],
                      )
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

  Widget _buildDateTimePicker(BuildContext context, AddMomentViewModel model,
      DateTime? selectedDate, Function(DateTime) onDateSelected) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: GestureDetector(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            onDateSelected(pickedDate);
          }
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedDate != null
                    ? DateFormat.yMMMd().format(selectedDate)
                    : 'Select Date & Time',
                style: TextStyle(
                    color: selectedDate != null ? Colors.black : Colors.grey),
              ),
              const Icon(Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }
}
