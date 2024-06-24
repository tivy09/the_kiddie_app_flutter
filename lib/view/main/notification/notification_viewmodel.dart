import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/model/notification_model.dart';

class NotificationViewModel extends BaseViewModel {
  final List<Notification> _notifications = [
    Notification(
      name: 'Kim Jisoo',
      relation: 'Mother',
      avatarUrl: 'https://example.com/jisoo.jpg', // Replace with actual URL
      message:
          'I have sent you a new message. Click here to view the conversation.',
      date: DateTime(2023, 12, 24),
    ),
    Notification(
      name: 'Jennie Kim',
      relation: 'Mother',
      avatarUrl: 'https://example.com/jennie.jpg', // Replace with actual URL
      message:
          'I have sent you a new message. Click here to view the conversation.',
      date: DateTime(2023, 12, 24),
    ),
    Notification(
      name: 'Lee Min Ho',
      relation: 'Mother',
      avatarUrl: 'https://example.com/lee.jpg', // Replace with actual URL
      message:
          'You\'ve received a payment of RM1890.00 from Lee Min Ho (father of Lee Kyung Jung from class K1 2019). Click here to view details.',
      date: DateTime(2023, 12, 24),
    ),
    Notification(
      name: 'Park Seo Joon',
      relation: 'Father',
      avatarUrl: 'https://example.com/park.jpg', // Replace with actual URL
      message:
          'Your child, Park Ji Hoon, has been absent today. Click here for more details.',
      date: DateTime(2023, 12, 23),
    ),
    Notification(
      name: 'Song Hye Kyo',
      relation: 'Mother',
      avatarUrl: 'https://example.com/song.jpg', // Replace with actual URL
      message:
          'A new event has been scheduled. Check the event calendar for more details.',
      date: DateTime(2023, 12, 22),
    ),
    Notification(
      name: 'Hyun Bin',
      relation: 'Father',
      avatarUrl: 'https://example.com/hyun.jpg', // Replace with actual URL
      message:
          'There is a parent-teacher meeting scheduled for tomorrow. Click here for the agenda.',
      date: DateTime(2023, 12, 21),
    ),
    Notification(
      name: 'IU',
      relation: 'Mother',
      avatarUrl: 'https://example.com/iu.jpg', // Replace with actual URL
      message:
          'Your payment of RM1500.00 has been received. Click here for the receipt.',
      date: DateTime(2023, 12, 20),
    ),
    Notification(
      name: 'Gong Yoo',
      relation: 'Father',
      avatarUrl: 'https://example.com/gong.jpg', // Replace with actual URL
      message:
          'Gong Ji Cheol’s performance has improved significantly. Click here to see the report.',
      date: DateTime(2023, 12, 19),
    ),
    Notification(
      name: 'Suzy',
      relation: 'Mother',
      avatarUrl: 'https://example.com/suzy.jpg', // Replace with actual URL
      message: 'Suzy has a new message for you. Click here to read it.',
      date: DateTime(2023, 12, 18),
    ),
    Notification(
      name: 'Yoo Jae Suk',
      relation: 'Father',
      avatarUrl: 'https://example.com/yoo.jpg', // Replace with actual URL
      message:
          'The school will be closed next week for holidays. Click here for the schedule.',
      date: DateTime(2023, 12, 17),
    ),
    Notification(
      name: 'Kim Soo Hyun',
      relation: 'Father',
      avatarUrl: 'https://example.com/kim.jpg', // Replace with actual URL
      message:
          'You have a new assignment notification. Click here for details.',
      date: DateTime(2023, 12, 16),
    ),
    Notification(
      name: 'Park Bo Gum',
      relation: 'Father',
      avatarUrl: 'https://example.com/parkbogum.jpg', // Replace with actual URL
      message:
          'Park Bo Gum’s exam results are out. Click here to view the results.',
      date: DateTime(2023, 12, 15),
    ),
  ];

  List<Notification> get notifications => _notifications;

  Map<DateTime, List<Notification>> get groupedNotifications {
    Map<DateTime, List<Notification>> grouped = {};
    for (var notification in _notifications) {
      DateTime date = DateTime(notification.date.year, notification.date.month,
          notification.date.day);
      if (!grouped.containsKey(date)) {
        grouped[date] = [];
      }
      grouped[date]!.add(notification);
    }
    return grouped;
  }

  void printNotifications() {
    for (var notification in _notifications) {
      print(
          'Name: ${notification.name}, Relation: ${notification.relation}, Date: ${notification.date}');
    }
  }
}
