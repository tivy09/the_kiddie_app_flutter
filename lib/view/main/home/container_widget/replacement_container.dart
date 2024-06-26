import 'package:flutter/material.dart';
import 'package:thekiddle_app/view/main/home/home_viewmodel.dart';

class ReplacementRequestContainer extends StatelessWidget {
  final HomeViewModel model;

  const ReplacementRequestContainer({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFCE4EC),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Replacement Request',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 18.0,
                4.0), // Padding for left, top, right, and bottom
            margin:
                const EdgeInsets.only(right: 50.0), // Margin for the right side
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  'Lesson',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  'Submitted On',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: model.replacementRequests.length,
            itemBuilder: (context, index) {
              final request = model.replacementRequests[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                padding: const EdgeInsets.all(8.0),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(8.0),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.1),
                //       spreadRadius: 1,
                //       blurRadius: 5,
                //       offset: const Offset(0, 2),
                //     ),
                //   ],
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          request['status']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 4),
                        if (request['status'] == 'Pending')
                          const Icon(Icons.circle,
                              size: 10, color: Colors.blue),
                        if (request['status'] == 'Approved')
                          const Icon(Icons.circle,
                              size: 10, color: Colors.green),
                        if (request['status'] == 'Reject')
                          const Icon(Icons.circle, size: 10, color: Colors.red),
                      ],
                    ),
                    Text(
                      request['lesson']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      request['submittedOn']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
