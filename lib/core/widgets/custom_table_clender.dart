import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalendar extends StatefulWidget {
  CustomTableCalendar({super.key, required this.initialDay, required this.onDaySelected});

  final String initialDay;
  final Function(String) onDaySelected;

  @override
  State<CustomTableCalendar> createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.tryParse(widget.initialDay) ?? DateTime.now();
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    widget.onDaySelected(day.toString().split(' ')[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(16),
      child: TableCalendar(
        locale: 'en_US',
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        selectedDayPredicate: (day) => isSameDay(day, selectedDate),
        availableGestures: AvailableGestures.all,
        focusedDay: selectedDate,
        firstDay: DateTime.utc(2010, 10, 10),
        lastDay: DateTime.utc(2050, 10, 10),
        onDaySelected: (day, focusedDay) {
          setState(() {
            selectedDate = day;
          });
          _onDaySelected(day, focusedDay);
        },
      ),
    );
  }
}
