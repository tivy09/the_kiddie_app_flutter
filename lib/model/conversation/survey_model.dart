// survey_model.dart
class Survey {
  final String id;
  final String title;
  final String description;
  final String createdBy;
  final DateTime createdAt;
  final double responseYes;
  final double responseNo;
  final int totalResponses;
  final int totalInvited;
  final DateTime expiredAt;

  Survey({
    required this.id,
    required this.title,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.responseYes,
    required this.responseNo,
    required this.totalResponses,
    required this.totalInvited,
    required this.expiredAt,
  });

  // Add any necessary methods or factory constructors here
}

List<Survey> sampleSurveys = [
  Survey(
    id: '1',
    title: 'Annual Concert 27 December 2023',
    description:
        'Dear parents, lorem ipsum dolor sit. Please vote and reply. Thank you.',
    createdBy: 'You',
    createdAt: DateTime(2023, 12, 28, 10, 15),
    responseYes: 89.5,
    responseNo: 10.5,
    totalResponses: 27,
    totalInvited: 35,
    expiredAt: DateTime(2023, 12, 29),
  ),
  // Add more surveys here
];
