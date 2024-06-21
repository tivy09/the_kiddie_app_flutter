import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/profile/profile_viewmodel.dart';
import 'package:thekiddle_app/view/main/profile/tab_widget/password_tab.dart';
import 'package:thekiddle_app/view/main/profile/tab_widget/profile_tab.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) {
        return DefaultTabController(
          length: 2,
          initialIndex: model.currentIndex,
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Header(),
            ),
            drawer: const DrawerView(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD1C4E9),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        'Account',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    // backgroundImage: AssetImage(
                    //     'assets/profile.jpg'), // Update with your image asset
                  ),
                ),
                const SizedBox(height: 8),
                TabBar(
                  onTap: model.setCurrentIndex,
                  tabs: const [
                    Tab(text: 'Profile'),
                    Tab(text: 'Password'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ProfileTab(model: model),
                      PasswordTab(model: model),
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
