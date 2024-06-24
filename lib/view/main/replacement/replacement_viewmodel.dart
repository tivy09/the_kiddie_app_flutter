import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/replacement/addForm/replacement_request_view.dart';

class ReplacementRequest {
  final String lesson;
  final String date;
  final String reason;
  final String className;
  final String status;

  ReplacementRequest({
    required this.lesson,
    required this.date,
    required this.reason,
    required this.className,
    required this.status,
  });
}

class ReplacementViewModel extends BaseViewModel {
  final List<ReplacementRequest> _requests = [
    ReplacementRequest(
      lesson: 'Programming',
      date: '26 September 2023',
      reason: 'Sick Leave',
      className: 'K 2019',
      status: 'Approved',
    ),

    ReplacementRequest(
      lesson: 'Programming',
      date: '26 September 2023',
      reason: 'Sick Leave',
      className: 'K 2019',
      status: 'Approved',
    ),

    ReplacementRequest(
      lesson: 'Programming',
      date: '26 September 2023',
      reason: 'Sick Leave',
      className: 'K 2019',
      status: 'Approved',
    ),
    // Add more requests here
  ];

  void navigateToReplacementRequest(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ReplacementRequestView()),
    );
  }

  List<ReplacementRequest> get requests => _requests;
}
