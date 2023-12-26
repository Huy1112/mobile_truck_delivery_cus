import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_delivery_customer/screen/confirm_order_page.dart';
import 'package:truck_delivery_customer/screen/dashboard_screen.dart';
import 'package:truck_delivery_customer/screen/delivery_detail.dart';
import 'package:truck_delivery_customer/screen/login.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: "/",
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: "/login",
      page: () => LoginPage(),
    ),
    GetPage(
      name: "/deliveryDetail",
      page: () => DeliveryDetail(),
    ),
    GetPage(
        name: "/confirmOrder",
        page: () => ConfirmOrderPage(),
        arguments: Get.arguments),
    // GetPage(
    //   name: "/stock",
    //   page: () => const ResponsiveLayout(
    //     content: Align(
    //       alignment: Alignment.center,
    //       child: Text("stock"),
    //     ),
    //   ),
    // ),
    // GetPage(
    //   name: "/product",
    //   page: () => const ResponsiveLayout(
    //     content: Align(
    //       alignment: Alignment.center,
    //       child: Text("product"),
    //     ),
    //   ),
    // ),
    // GetPage(
    //   name: "/sale",
    //   page: () => const ResponsiveLayout(
    //     content: Align(
    //       alignment: Alignment.center,
    //       child: Text("sale"),
    //     ),
    //   ),
    // ),
    // GetPage(
    //   name: "/vente",
    //   page: () => const ResponsiveLayout(
    //     content: Align(
    //       alignment: Alignment.center,
    //       child: Text("vente"),
    //     ),
    //   ),
    // ),
    // GetPage(
    //   name: "/staff",
    //   page: () => const ResponsiveLayout(
    //     content: Align(
    //       alignment: Alignment.center,
    //       child: Text("staff"),
    //     ),
    //   ),
    // ),
    // GetPage(
    //   name: "/setting",
    //   page: () => const ResponsiveLayout(
    //     content: Align(
    //       alignment: Alignment.center,
    //       child: Text("setting"),
    //     ),
    //   ),
    // ),
    // GetPage(
    //   name: "/logout",
    //   page: () => const ResponsiveLayout(
    //     content: Align(
    //       alignment: Alignment.center,
    //       child: Text("logout"),
    //     ),
    //   ),
    // ),

    // GetPage(
    //   name: "/",
    //   page: () => DashboardPage(),
    //   bindings: [
    //     OverviewBinding(),
    //   ],
    // ),
  ];
}