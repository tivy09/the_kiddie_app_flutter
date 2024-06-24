import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/replacement/replacement_viewmodel.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';
import 'package:thekiddle_app/widget/others/page_title.dart';

class ReplacementView extends StatelessWidget {
  const ReplacementView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReplacementViewModel>.reactive(
      viewModelBuilder: () => ReplacementViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Header(),
          ),
          drawer: const DrawerView(),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: PageTitle(title: 'Replacement Request'),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 1.0, left: 16.0, right: 16.0, bottom: 16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCE4EC),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 16.0, right: 16.0, bottom: 0.0),
                          child: Row(
                            children: [
                              const Spacer(),
                              ElevatedButton.icon(
                                onPressed: () {
                                  model.navigateToReplacementRequest(context);
                                },
                                icon: const Icon(Icons.add),
                                label: const Text('Request New'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3E97FF),
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            itemCount: model.requests.length,
                            itemBuilder: (context, index) {
                              final request = model.requests[index];
                              return Card(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: const BorderSide(
                                    color: Color(0xFFB5B5B5), // Border color
                                    width: 1.0, // Border width
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Lesson: ${request.lesson}'),
                                      const SizedBox(height: 8),
                                      Text('Date: ${request.date}'),
                                      const SizedBox(height: 8),
                                      Text('Reason: ${request.reason}'),
                                      const SizedBox(height: 8),
                                      Text('Class: ${request.className}'),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Status: ${request.status}',
                                        style: TextStyle(
                                          color: request.status == 'Approved'
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
