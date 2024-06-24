import 'package:flutter/material.dart';
import 'package:thekiddle_app/view/main/profile/profile_viewmodel.dart';

class ProfileTab extends StatelessWidget {
  final ProfileViewModel model;

  const ProfileTab({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final InputDecoration fieldDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.blue,
        ),
      ),
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            TextField(
              decoration: fieldDecoration.copyWith(
                labelText: 'First Name',
              ),
              onChanged: model.setFirstName,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: fieldDecoration.copyWith(
                labelText: 'Last Name',
              ),
              onChanged: model.setLastName,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: fieldDecoration.copyWith(
                labelText: 'Email Address',
              ),
              onChanged: model.setEmailAddress,
            ),
            const SizedBox(height: 8),
            InputDecorator(
              decoration: fieldDecoration.copyWith(
                labelText: 'Date of Birth',
              ),
              child: InkWell(
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    model.setDateOfBirth(picked);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.dateOfBirth == null
                          ? ''
                          : model.dateOfBirth!
                              .toLocal()
                              .toString()
                              .split(' ')[0],
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: model.language,
              decoration: fieldDecoration.copyWith(
                labelText: 'Language',
              ),
              onChanged: model.setLanguage,
              items: ['English', 'Spanish', 'French']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: fieldDecoration.copyWith(
                labelText: 'Phone Number',
              ),
              onChanged: model.setPhoneNumber,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: model.role,
              decoration: fieldDecoration.copyWith(
                labelText: 'Role',
              ),
              onChanged: model.setRole,
              items: ['Teacher', 'Admin', 'Student']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: model.education,
              decoration: fieldDecoration.copyWith(
                labelText: 'Education',
              ),
              onChanged: model.setEducation,
              items: ['Bachelor', 'Master', 'PhD']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: fieldDecoration.copyWith(
                labelText: 'Bio (max 20 words)',
              ),
              maxLength: 20,
              onChanged: model.setBio,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: model.updateProfile,
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
