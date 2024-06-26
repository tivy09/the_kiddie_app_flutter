class Bulletin {
  final DateTime date;
  final String time;
  final String title;
  final String description;
  final String organizer;

  Bulletin({
    required this.date,
    required this.time,
    required this.title,
    required this.description,
    required this.organizer,
  });

  factory Bulletin.fromJson(Map<String, dynamic> json) {
    return Bulletin(
      date: DateTime.parse(json['date']),
      time: json['time'],
      title: json['title'],
      description: json['description'],
      organizer: json['organizer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'time': time,
      'title': title,
      'description': description,
      'organizer': organizer,
    };
  }
}

// Function to generate default data
List<Bulletin> getDefaultBulletins() {
  return [
    Bulletin(
      date: DateTime(2023, 12, 29),
      time: '9:16',
      title: 'CHRISTMAS CELEBRATION!',
      description: '''CHRISTMAS CELEBRATION!

Christmas is just around the corner!🎅
EUNOIA will be celebrating Christmas party & Gift exchange on:
Date: 22nd December 2023 (Friday)
Time: 9am to 12pm🎄
Please bring a wrapped gift🎁 that is worth RM15 or more🎄
Must be gender-neutral gift.
Let’s all put on their best Christmas costume & look forward for a fun and memorable Christmas Celebration!🥳''',
      organizer: 'EUNOIA Preschool',
    ),
    // Add more bulletin instances here as needed
  ];
}
