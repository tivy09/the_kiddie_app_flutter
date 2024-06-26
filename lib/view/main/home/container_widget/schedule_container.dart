import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../home_viewmodel.dart';

class NextScheduleContainer extends StatelessWidget {
  final HomeViewModel model;

  const NextScheduleContainer({required this.model, super.key});

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
          TableCalendar(
            availableGestures: AvailableGestures.none,
            focusedDay: model.focusedDay,
            firstDay: DateTime(2020, 1, 1),
            lastDay: DateTime(2030, 12, 31),
            selectedDayPredicate: (day) {
              return isSameDay(model.selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              model.onDaySelected(selectedDay, focusedDay);
            },
            calendarFormat: model.calendarFormat,
            onFormatChanged: (format) {
              model.onFormatChanged(format);
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: const Color(0xFF6667AA).withOpacity(0.14),
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: const Color(0xFF6667AA).withOpacity(0.86),
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
              rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Next Schedule',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: model.nextSchedule.length,
            itemBuilder: (context, index) {
              final schedule = model.nextSchedule[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(int.parse(schedule['color']!)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      schedule['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      schedule['time']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
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
