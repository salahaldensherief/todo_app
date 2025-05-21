import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:todo_app/features/home/presentation/views/widgets/day_time_widget.dart';
import 'package:todo_app/features/home/presentation/views/widgets/task_list_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });
  static const routeName = 'homeview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    CustomAppBar(),
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 90,
                      child: DayTimeWidget(),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.30,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TaskListWidget()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
