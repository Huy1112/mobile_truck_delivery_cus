import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dashboard_controller.dart';
import '../wigets/widget_home.dart';

class DashboardScreen extends StatelessWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());
    return Scaffold(
        backgroundColor: Colors.white30,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Obx(() => _widgetOptions.elementAt(dashboardController.getIndex)),
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: Colors.white,
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: Colors.red),
            child: Obx(() => BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Trang Chủ',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.pending_actions),
                      label: 'Hoạt Động',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.history_outlined),
                      label: 'Lịch Sử',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Cài Đặt',
                    ),
                  ],
                  currentIndex: dashboardController.getIndex,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.green,
                  onTap: (index) => dashboardController.onItemTapped(index),
                ))));
  }
}
