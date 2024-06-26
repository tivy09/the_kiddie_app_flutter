import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/model/conversation/survey_model.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/survey/survey_viewmodel.dart';

class SurveyTab extends StatelessWidget {
  final List<Survey> surveys;

  const SurveyTab({super.key, required this.surveys});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SurveyViewModel>.reactive(
      viewModelBuilder: () => SurveyViewModel(),
      builder: (context, model, child) {
        return buildListView(context, model, surveys);
      },
    );
  }
}

Widget buildListView(
    BuildContext context, SurveyViewModel model, List<Survey> surveys) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
              label: const Text('Filter'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                model.navigateToAddSurvey(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              child: const Text('+ Add New',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          // Use Expanded here to ensure the ListView gets a defined height.
          child: SurveyListView(surveys: surveys, model: model),
        ),
      ],
    ),
  );
}

class SurveyListView extends StatelessWidget {
  final List<Survey> surveys;
  final SurveyViewModel model;

  const SurveyListView({super.key, required this.surveys, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: surveys.length,
      itemBuilder: (context, index) {
        final survey = surveys[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150'), // Replace with the actual image URL or asset if available
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'You', // Assuming the current user is viewing
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${survey.createdAt.day} ${model.monthName(survey.createdAt.month)} ${survey.createdAt.year}, ${survey.createdAt.hour}:${model.twoDigits(survey.createdAt.minute)} ${model.amPm(survey.createdAt.hour)}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              survey.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              survey.description,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Survey:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text('Yes: '),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: survey.responseYes / 100,
                                    backgroundColor: Colors.grey[300],
                                    color: Colors.brown,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                    '${survey.responseYes.toStringAsFixed(1)}%'),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Text('No: '),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: survey.responseNo / 100,
                                    backgroundColor: Colors.grey[300],
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                    '${survey.responseNo.toStringAsFixed(1)}%'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      const SizedBox(height: 5),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${survey.totalResponses}/${survey.totalInvited} parents have responded',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Expires on ${survey.expiredAt.day} ${model.monthName(survey.expiredAt.month)} ${survey.expiredAt.year}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
