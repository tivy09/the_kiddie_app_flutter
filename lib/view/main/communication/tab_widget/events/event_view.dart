import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/model/conversation/event_model.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/events/event_viewmodel.dart';
import 'package:thekiddle_app/view/main/communication/tab_widget/events/event_detail_view.dart';

class EventsTab extends StatelessWidget {
  final List<Event> events;

  const EventsTab({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventViewModel>.reactive(
      viewModelBuilder: () => EventViewModel(),
      builder: (context, model, child) {
        return model.isDetailView
            ? EventDetailView(event: model.selectedEvent!)
            : buildListView(context, model, events);
      },
    );
  }
}

Widget buildListView(
    BuildContext context, EventViewModel model, List<Event> events) {
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
        Expanded(
          child: EventListView(events: events, model: model),
        ),
      ],
    ),
  );
}

class EventListView extends StatelessWidget {
  final List<Event> events;
  final EventViewModel model;

  const EventListView({super.key, required this.events, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GestureDetector(
            onTap: () {
              model.showEventDetail(event);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${event.date.day} ${model.monthName(event.date.month)} ${event.date.year}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${model.dayName(event.date.weekday)}, ${event.date.day} ${model.monthName(event.date.month)}, ${event.time}',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          event.description,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Warm regards,\n${event.organizer}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
