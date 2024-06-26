class Event {
  final DateTime date;
  final String title;
  final String time;
  final String description;
  final String organizer;

  Event({
    required this.date,
    required this.title,
    required this.time,
    required this.description,
    required this.organizer,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      date: DateTime.parse(json['date']),
      title: json['title'],
      time: json['time'],
      description: json['description'],
      organizer: json['organizer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'title': title,
      'time': time,
      'description': description,
      'organizer': organizer,
    };
  }
}

// Function to generate default data
List<Event> getDefaultEvents() {
  return [
    Event(
      date: DateTime(2023, 12, 28),
      title: 'EUNOIA GLOBAL EDUCARE SDN BHD',
      time: '10.15 a.m',
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
    // Add more event instances here as needed
    Event(
      date: DateTime(2023, 11, 20),
      title: 'School Annual Day',
      time: '5:00 p.m',
      description: '''SCHOOL ANNUAL DAY!

Join us for an evening of fun and festivities as we celebrate our Annual Day with various performances by students.

Date: 20th November 2023 (Monday)
Time: 5:00 p.m to 8:00 p.m
Venue: School Auditorium

We look forward to your presence!''',
      organizer: 'School Administration',
    ),
  ];
}
