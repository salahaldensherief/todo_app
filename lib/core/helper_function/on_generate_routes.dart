import 'package:flutter/material.dart';
import 'package:todo_app/features/home/presentation/views/home_view.dart';

import 'package:todo_app/features/home/presentation/views/widgets/bottom_navigation_tabs.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());
    case BottomNavigationTabs.routeName:
      return MaterialPageRoute(builder: (context) => BottomNavigationTabs());

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Page Not Found')),
          body: Center(child: Text('This page does not exist')),
        ),
      );
  }
}
