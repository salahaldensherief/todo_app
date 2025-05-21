import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';

import '../../../../../core/widgets/custom_table_clender.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({super.key, this.day});
  final String? day;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  late String selectedDay;

  @override
  void initState() {
    super.initState();
    selectedDay = widget.day ?? DateTime.now().toString().split(' ')[0];
  }

  void addNewTask() {
    print('New Task Added on $selectedDay');
  }

  void showTableCalendar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomTableCalendar(
          initialDay: selectedDay,
          onDaySelected: (day) {
            setState(() {
              selectedDay = day;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(),
        height: 400,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New Task',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            CustomTextFormField(
              hintText: 'Title',
            ),
            CustomTextFormField(
              hintText: 'Description',
              lines: 4,
            ),
            GestureDetector(
              onTap: () {
                showTableCalendar(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Text(
                  "Date: $selectedDay",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FloatingActionButton(
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 40,
                ),
                backgroundColor: AppColors.secandColor,
                shape: StadiumBorder(
                    side: BorderSide(color: Colors.white, width: 4)),
                onPressed: addNewTask,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
