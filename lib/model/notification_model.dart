// notification_model.dart

class Notification {
  final String name;
  final String relation;
  final String avatarUrl;
  final String message;
  final DateTime date;

  Notification({
    required this.name,
    required this.relation,
    required this.avatarUrl,
    required this.message,
    required this.date,
  });
}
