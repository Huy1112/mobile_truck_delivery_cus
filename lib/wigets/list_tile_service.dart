import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_colors.dart';
import '../controller/deliveryDetailController.dart';

class ListTileService extends StatelessWidget {
  final Widget content;
  final Widget texttitle;
  final Widget leadingIcon;
  final double heightBottomsheet;
  final bool haveIcon;

  const ListTileService(
      {super.key,
      required this.content,
      required this.heightBottomsheet,
      required this.texttitle,
      required this.leadingIcon,
      required this.haveIcon});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryDetailController>(
        builder: (deliveryDetailController) => ListTile(
              contentPadding: haveIcon ? EdgeInsets.fromLTRB(10, 0, 5, 0) : null,
              leading: haveIcon ? leadingIcon : null,
              title: texttitle,
              trailing: const Icon(
                Icons.navigate_next,
                size: 25,
                color: AppColors.black,
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Container(
                    height:
                        MediaQuery.of(context).size.height * heightBottomsheet,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: content,
                    ),
                  ),
                );
              },
            )); // more widgets
  }
}
