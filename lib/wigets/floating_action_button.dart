import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_delivery_customer/constant/app_colors.dart';

class FloatingActionButtonForm extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String url;


  const FloatingActionButtonForm({
    Key? key,
    required this.iconData,
    required this.label,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: SizedBox(
      height: 60,
      child:  FittedBox(child: FloatingActionButton.small(
        tooltip: "test",
        backgroundColor: AppColors.white,
        onPressed: () {Get.toNamed(url);},
        child: Icon(
          iconData,
          size: 25,
          color: Colors.black,
        ),
      )),
    ),);
  }


}
