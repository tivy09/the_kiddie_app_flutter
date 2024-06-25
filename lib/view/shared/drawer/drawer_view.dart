import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:badges/badges.dart' as badges;
import 'package:thekiddle_app/view/shared/drawer/drawer_viewmodel.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
      viewModelBuilder: () => DrawerViewModel(),
      builder: (context, model, child) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  model.navigateToProfile(context);
                },
                child: const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color(0xFFD1C4E9)),
                  accountName: Text('Go Younjung'),
                  accountEmail: Text('Teacher'),
                  currentAccountPicture: CircleAvatar(
                      // backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Dashboard'),
                onTap: () {
                  model.navigateToDashboard(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notification'),
                onTap: () {
                  model.navigateToNotification(context);
                },
                trailing: badges.Badge(
                  badgeContent: Text(
                    '${model.notificationCount}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Students'),
                onTap: () {
                  model.navigateToStudent(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Calendar'),
                onTap: () {
                  model.navigateToCalendar(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Moment'),
                onTap: () {
                  model.navigateToMoment(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text('Communication'),
                onTap: () {
                  model.navigateToCommunication(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Payroll'),
                onTap: () {
                  model.navigateToPayroll(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.repeat),
                title: const Text('Replacement'),
                onTap: () {
                  model.navigateToReplacement(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
