// communication_model.dart
class Broadcast {
  final int id;
  final String title;
  final String description;
  final String attachmentTitle;
  final String attachmentUrl;
  final String username;
  final DateTime datetime;
  final String avatar;

  Broadcast({
    required this.id,
    required this.title,
    required this.description,
    required this.attachmentTitle,
    required this.attachmentUrl,
    required this.username,
    required this.avatar,
    required this.datetime,
  });
}

final List<Broadcast> sampleBroadcasts = [
  Broadcast(
    id: 1,
    title: 'Annual Concert 27 December 2023',
    description: 'Dear parents, lorem ipsum dolor sit. Thank you.',
    attachmentTitle: 'Concert Image',
    attachmentUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkqb6n5-cyXHc20KIlKnUMthPOSzXtKssHYw&s',
    username: 'Lalisa Manoban',
    avatar:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkqb6n5-cyXHc20KIlKnUMthPOSzXtKssHYw&s', // Update with actual image path
    datetime: DateTime.parse('2023-12-28 10:15:00'),
  ),
  // Add more sample data here if needed
];
