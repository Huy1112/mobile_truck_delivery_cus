import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_delivery_customer/screen/dashboard_screen.dart';
import 'package:truck_delivery_customer/screen/login.dart';
import 'package:truck_delivery_customer/wigets/web_drag_scroll_behavior.dart';

import 'app_routes.dart';
import 'constant/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: DashboardScreen(),
      title: 'Responsive dashboard ',
      debugShowCheckedModeBanner: false,
      // scrollBehavior: WebDragScrollBehavior(),
      getPages: AppPages.routes,
      theme: ThemeData(
        // buttonTheme: const ButtonThemeData(
        //   buttonColor: AppColors.buttonColor,     //  <-- dark color
        //   textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
        // ),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black)),
        textTheme:
        Theme.of(context).textTheme.apply(displayColor: Colors.black),
        drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
        navigationRailTheme: const NavigationRailThemeData(
          backgroundColor: Colors.black,
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          selectedIconTheme: IconThemeData(color: Colors.white),
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.grey,
          iconColor: Colors.grey,
          contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        dividerTheme: const DividerThemeData(
            color: Colors.grey, indent: 32, endIndent: 32),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.indigoAccent,
          secondary: Colors.deepOrange,
        ),
        cardTheme: const CardTheme(elevation: 5.0, shadowColor: Colors.black),
      ),
    );
  }
}