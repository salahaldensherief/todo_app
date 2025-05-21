import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/features/home/presentation/views/home_view.dart';
import 'package:todo_app/features/home/presentation/views/widgets/bottom_sheet_widget.dart';
import 'package:todo_app/features/home/presentation/views/widgets/setting_tab.dart';

class BottomNavigationTabs extends StatefulWidget {
  static const routeName = 'bottomtabs';
  const BottomNavigationTabs({super.key});

  @override
  State<BottomNavigationTabs> createState() => _BottomNavigationTabsState();
}

class _BottomNavigationTabsState extends State<BottomNavigationTabs> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeView(),
    const SettingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secandColor,
        onPressed: () {
          showDialogBottomSheet();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.white, width: 4),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: IconButton(
                  icon: Icon(
                    Icons.list,
                    size: selectedIndex == 0 ? 30 : 25,
                    color: selectedIndex == 0 ? Colors.white : Colors.white54,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    size: selectedIndex == 1 ? 30 : 25,
                    color: selectedIndex == 1 ? Colors.white : Colors.white54,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDialogBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.black87,
        context: context,
        builder: (buildcontext) {
          return BottomSheetWidget();
        });
  }
}
