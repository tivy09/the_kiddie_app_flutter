import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/home/home_viewmodel.dart';
import 'package:badges/badges.dart' as badges;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.grey),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            title: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.tag_faces, color: Colors.pink),
                SizedBox(width: 4),
                Text(
                  'Kiddie',
                  style: TextStyle(
                    fontFamily:
                        'Roboto', // Replace with your desired font family
                    fontSize: 24,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.grey),
                onPressed: () {
                  // Handle search button press
                },
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color(0xFFD1C4E9)),
                  accountName: Text('Go Younjung'),
                  accountEmail: Text('Teacher'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/profile.jpg'), // Replace with your profile image
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Dashboard'),
                  onTap: () {
                    // Handle dashboard tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notification'),
                  onTap: () {
                    // Handle notification tap
                  },
                  trailing: badges.Badge(
                    badgeContent:
                        const Text('1', style: TextStyle(color: Colors.white)),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Students'),
                  onTap: () {
                    // Handle students tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Calendar'),
                  onTap: () {
                    // Handle calendar tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text('Moment'),
                  onTap: () {
                    // Handle moment tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Communication'),
                  onTap: () {
                    // Handle communication tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.payment),
                  title: const Text('Payroll'),
                  onTap: () {
                    // Handle payroll tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.repeat),
                  title: const Text('Replacement'),
                  onTap: () {
                    // Handle replacement tap
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Stacked Introduction'),
                Text(model.myDeclaration),
                TextButton(
                  onPressed: () => model.navigateToSignIn(),
                  child: const Text('Go To Profile View'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
