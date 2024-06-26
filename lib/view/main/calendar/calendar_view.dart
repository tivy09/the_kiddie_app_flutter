import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thekiddle_app/view/main/calendar/calendar_viewmodel.dart';
import 'package:thekiddle_app/view/shared/drawer/drawer_view.dart';
import 'package:thekiddle_app/view/shared/header/header.dart';
import 'package:thekiddle_app/widget/others/page_title.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalendarViewModel>.reactive(
      viewModelBuilder: () => CalendarViewModel(),
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
                child: PageTitle(title: 'Calendar'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildHeader(),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCE4EC),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildCalendar(model),
                        ),
                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: _buildNextSchedule(model),
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

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: "Monthly View",
                      isDense: true,
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      items: [
                        "Monthly View",
                        "Weekly View with longer text to test overflow handling"
                      ]
                          .map((view) => DropdownMenuItem<String>(
                                value: view,
                                child: Text(
                                  view.toString(),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      //fix this ui problem//
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFAFAFAF),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFAFAFAF),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFAFAFAF),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      value: 2023,
                      items: [2023, 2024]
                          .map((year) => DropdownMenuItem<int>(
                                value: year,
                                child: Text(
                                  year.toString(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFAFAFAF),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFAFAFAF),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFAFAFAF),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFFFFC1E3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          child: const Text(
            "+ Add Request",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendar(CalendarViewModel model) {
    return TableCalendar(
      focusedDay: model.focusedDay,
      firstDay: DateTime(2020, 1, 1),
      lastDay: DateTime(2030, 12, 31),
      selectedDayPredicate: (day) {
        return isSameDay(model.selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        model.onDaySelected(selectedDay, focusedDay);
      },
      calendarFormat: CalendarFormat.month,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Monthly View',
      },
      calendarStyle: const CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Color(0xFFFCE4E9),
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.blueAccent,
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
    );
  }

  Widget _buildNextSchedule(CalendarViewModel model) {
    return Container(
      color: Color(0xFFFCE4E9),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Next Schedule",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...model.nextSchedule.map((event) => Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: _getColorFromHex(event.color),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(event.time),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
