import 'package:flutter/material.dart';
import 'package:thekiddle_app/view/main/profile/profile_viewmodel.dart';

class PasswordTab extends StatelessWidget {
  final ProfileViewModel model;

  const PasswordTab({required this.model, Key? key}) : super(key: key);

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
                labelText: 'Current Password',
              ),
              obscureText: true,
              onChanged: (value) {
                // Handle current password change
              },
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: fieldDecoration.copyWith(
                labelText: 'New Password',
              ),
              obscureText: true,
              onChanged: (value) {
                // Handle new password change
              },
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: fieldDecoration.copyWith(
                labelText: 'Confirm New Password',
              ),
              obscureText: true,
              onChanged: (value) {
                // Handle confirm new password change
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle password update
              },
              child: const Text('Update Password'),
            ),
          ],
        ),
      ),
    );
  }
}
