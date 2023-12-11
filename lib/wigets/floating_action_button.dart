import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_delivery_customer/constant/app_colors.dart';

class FloatingActionButtonForm extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String url;
  final String heroTag;


  const FloatingActionButtonForm({
    Key? key,
    required this.iconData,
    required this.label,
    required this.url,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: FittedBox(child: FloatingActionButton.small(
        heroTag: heroTag,
        tooltip: "test",
        backgroundColor: AppColors.white,
        onPressed: () {Get.toNamed(url);},
        child: Icon(
          iconData,
          size: 25,
          color: Colors.black,
        ),
      )),
    );
  }


}
