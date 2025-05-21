import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/core/utils/app_colors.dart';

import 'core/helper_function/on_generate_routes.dart';
import 'features/home/presentation/views/widgets/bottom_navigation_tabs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await  Hive.openBox('todos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.primaryColor,
        useMaterial3: true,
      ),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: BottomNavigationTabs.routeName,
    );
  }
}
