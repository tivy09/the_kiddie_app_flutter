// communication_model.dart
class Broadcast {
  final String title;
  final String description;
  final String attachment;
  final String username;
  final DateTime datetime;
  final String avatar;

  Broadcast({
    required this.title,
    required this.description,
    required this.attachment,
    required this.username,
    required this.avatar,
    required this.datetime,
  });
}

final List<Broadcast> sampleBroadcasts = [
  Broadcast(
    title: 'Annual Concert 27 December 2023',
    description: 'Dear parents, lorem ipsum dolor sit. Thank you.',
    attachment: 'Image1.png',
    username: 'Lalisa Manoban',
    avatar: 'assets/images/lalisa.png', // Update with actual image path
    datetime: DateTime.parse('2023-12-28 10:15:00'),
  ),
  // Add more sample data here if needed
];
