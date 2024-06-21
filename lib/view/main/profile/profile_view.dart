import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/profile/profile_viewmodel.dart';
import 'package:thekiddle_app/view/main/profile/tab_widget/password_tab.dart';
import 'package:thekiddle_app/view/main/profile/tab_widget/profile_tab.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';
import 'package:thekiddle_app/widget/others/page_title.dart';

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
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: PageTitle(title: 'Account'),
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
