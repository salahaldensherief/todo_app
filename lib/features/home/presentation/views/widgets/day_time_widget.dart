import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayTimeWidget extends StatefulWidget {
  const DayTimeWidget({super.key});

  @override
  State<DayTimeWidget> createState() => _DayTimeWidgetState();
}

class _DayTimeWidgetState extends State<DayTimeWidget> {
  int? selectedIndex;

  DateTime today = DateTime.now();

  DateTime getStartOfWeek(DateTime date) {
    int dayOffset = date.weekday % 7;
    return date.subtract(Duration(days: dayOffset));
  }

  @override
  void initState() {
    super.initState();

    DateTime startOfWeek = getStartOfWeek(today);
    for (int i = 0; i < 7; i++) {
      DateTime day = startOfWeek.add(Duration(days: i));
      if (_isSameDate(day, today)) {
        selectedIndex = i;
        break;
      }
    }
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    final DateTime startOfWeek = getStartOfWeek(today);

    List<DateTime> weekDays = List.generate(
      7,
      (index) => startOfWeek.add(Duration(days: index)),
    );

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekDays.length,
        itemBuilder: (context, index) {
          DateTime date = weekDays[index];
          String dayName = DateFormat('EEE').format(date);
          String dayNumber = DateFormat('d MMM').format(date);

          bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.black87,
                borderRadius: BorderRadius.circular(12),
                border: isSelected
                    ? Border.all(color: Colors.white, width: 2)
                    : Border.all(
                        color: Colors.blue,
                      ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dayNumber,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
