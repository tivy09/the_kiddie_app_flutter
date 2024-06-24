import 'package:flutter/material.dart';
import 'package:thekiddle_app/view/main/profile/profile_viewmodel.dart';

class PasswordTab extends StatelessWidget {
  final ProfileViewModel model;

  const PasswordTab({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final InputDecoration fieldDecoration = InputDecoration(
      // Removed fillColor and filled properties
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
          width: 2.0,
        ),
      ),
      labelStyle: const TextStyle(
        color: Colors.grey,
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
                labelText: 'New Password',
              ),
              obscureText: true,
              onChanged: (value) {
                // Handle new password change
              },
            ),
            const SizedBox(height: 16), // Increased spacing
            TextField(
              decoration: fieldDecoration.copyWith(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
              onChanged: (value) {
                // Handle confirm new password change
              },
            ),
            const SizedBox(height: 32), // Increased spacing
            const Text(
              '2 Factor Authentication',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Handle 2FA enable
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Enable'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Protect your account with 2 step verification. Each time you sign in to your account, you will need your password and a verification code from an authenticator app.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32), // Increased spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Handle cancel action
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
