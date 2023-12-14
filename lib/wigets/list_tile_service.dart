import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_colors.dart';
import '../controller/deliveryDetailController.dart';

class ListTileService extends StatelessWidget {
  const ListTileService({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryDetailController>(
      builder: (deliveryDetailController) => Row(
        children: <Widget>[
          Flexible(
              child: ListTile(
            title: Text(
              'Lấy hàng trong ${deliveryDetailController.selectedService == 1 ? ' 1 - 2 ngày.' : '3 - 4 ngày.'} ',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.black),
            ),
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
                  height: MediaQuery.of(context).size.height * 0.37,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const ListTile(
                            title: Text(
                              'Chọn Dịch Vụ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black),
                            ),
                          ),
                          _radioButton(context,
                              label: 'Tiêu Chuẩn (3 - 4 ngày).', value: "0"),
                          _radioButton(context,
                              label: 'Hỏa Tốc (1 - 2 ngày).', value: "1"),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.appBottomBar,
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'Tiếp theo',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              );
            },
          )),
          // more widgets
        ],
      ),
    );
  }

  Widget _radioButton(BuildContext context,
          {required String label, required String value}) =>
      GetBuilder<DeliveryDetailController>(
          builder: (deliveryDetailController) => RadioListTile(
              title: Text(
                label,
                style: TextStyle(fontSize: 18),
              ),
              value: value,
              groupValue: deliveryDetailController.selectedService.toString(),
              onChanged: (value) => deliveryDetailController
                  .onClickRadioButtonToSetService(value!)));
}
