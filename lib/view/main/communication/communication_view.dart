import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/model/conversation/broadcast_model.dart';
import 'package:thekiddle_app/model/conversation/survey_model.dart';
import 'package:thekiddle_app/model/conversation/event_model.dart';
import 'package:thekiddle_app/view/main/communication/communication_viewmodel.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/broadcast/broadcast_view.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/conversation_view.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/events/event_view.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/survey/survey_view.dart';
import 'package:thekiddle_app/view/main/student/tab_widget/student_list.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';
import 'package:thekiddle_app/widget/others/page_title.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/events/event_viewmodel.dart';

class CommunicationView extends StatelessWidget {
  final int initialIndex;

  const CommunicationView({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    // Initialize the EventViewModel and fetch events
    EventViewModel eventViewModel = EventViewModel();
    eventViewModel.fetchEvents();

    return ViewModelBuilder<CommunicationViewmodel>.reactive(
      viewModelBuilder: () => CommunicationViewmodel(),
      builder: (context, model, child) {
        return DefaultTabController(
          length: 5, // Ensure this matches the number of tabs
          initialIndex: initialIndex, // Set the initial tab index
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Header(),
            ),
            drawer: const DrawerView(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const PageTitle(title: 'Communication'),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAE6E9),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const TabBar(
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            indicatorWeight: 4,
                            labelColor: Colors.pink,
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Colors.pink,
                            tabs: [
                              Tab(text: 'Conversations'),
                              Tab(text: 'Broadcast'),
                              Tab(text: 'Surveys'),
                              Tab(text: 'Events'),
                              Tab(text: 'Bulletins'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Expanded(
                            child: TabBarView(
                              children: [
                                const ConversationsTab(),
                                BroadcastsTab(broadcasts: sampleBroadcasts),
                                SurveyTab(surveys: sampleSurveys),
                                EventsTab(events: eventViewModel.events),
                                const StudentListTab(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
