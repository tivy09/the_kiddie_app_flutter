import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/notification/notification_viewmodel.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';
import 'package:thekiddle_app/widget/others/page_title.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:thekiddle_app/model/notification_model.dart' as model;

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationViewModel>.reactive(
      viewModelBuilder: () => NotificationViewModel(),
      builder: (context, viewModel, child) {
        viewModel.printNotifications(); // Print notifications to console
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
                  padding: EdgeInsets.all(16.0),
                  child: PageTitle(title: 'Notifications'),
                ),
                ...viewModel.groupedNotifications.entries.map((entry) {
                  final date = entry.key;
                  final notifications = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          DateFormat('EEEE, d MMM yyyy').format(date),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          final notification = notifications[index];
                          return NotificationCard(notification: notification);
                        },
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NotificationCard extends StatelessWidget {
  final model.Notification notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple
    ];
    final nameColor = colors[random.nextInt(colors.length)];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(notification.avatarUrl),
            radius: 24.0,
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 4.0, bottom: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE4EC),
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: notification.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: nameColor,
                        ),
                      ),
                      const TextSpan(
                        text: '  •  ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: notification.relation,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                buildMessage(notification.message),
              ],
            ),
          ),
        ),
      ],
    );
  }

  RichText buildMessage(String message) {
    final List<TextSpan> textSpans = [];

    message.splitMapJoin(
      RegExp(r'(\bLee Min Ho\b|\bLee Kyung Jung\b|\bhere\b)'),
      onMatch: (Match match) {
        final matchText = match[0]!;
        textSpans.add(
          TextSpan(
            text: matchText,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle tap on dynamic text
                print('Tapped on $matchText');
              },
          ),
        );
        return matchText;
      },
      onNonMatch: (String nonMatch) {
        textSpans.add(TextSpan(
            text: nonMatch, style: const TextStyle(color: Colors.black)));
        return nonMatch;
      },
    );

    return RichText(
      text: TextSpan(children: textSpans),
    );
  }
}
