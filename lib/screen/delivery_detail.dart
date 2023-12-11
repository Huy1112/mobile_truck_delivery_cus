import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_delivery_customer/constant/app_colors.dart';
import 'package:truck_delivery_customer/controller/deliveryDetailController.dart';
import '../utils/api_end_points.dart';
import '../wigets/places_autocomplete_field.dart';

class DeliveryDetail extends StatelessWidget {
  const DeliveryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final DeliveryDetailController deliveryDetailController =
        Get.put(DeliveryDetailController());
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: AppColors.appbarBackground,
            leading: const BackButton(),
            title: Text('Chi Tiết Đơn Đặt Hàng'),
          ),
          Card(
            margin: const EdgeInsets.all(16),
            color: AppColors.white,
            shadowColor: AppColors.black,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 60,
                      child: Icon(
                        Icons.my_location,
                        size: 35,
                        color: AppColors.primary,
                      ),
                    ),
                    Flexible(
                        child: PlacesAutocompleteField(
                      controller: deliveryDetailController.pointToPickupInput,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      apiKey: ApiEndPoints.API_Key,
                      hint: 'Địa Điểm Lấy Hàng',
                      inputDecoration: const InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                          fillColor: AppColors.transparent),
                    ))
                  ],
                ),
                const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 60,
                        child: Icon(
                          Icons.arrow_downward,
                          size: 15,
                        ),
                      ),
                    ]),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 60,
                      child: Icon(
                        Icons.location_on,
                        color: AppColors.blueAccent,
                        size: 35,
                      ),
                    ),
                    Flexible(
                      child: PlacesAutocompleteField(
                        apiKey: ApiEndPoints.API_Key,
                        controller: deliveryDetailController.destinationInput,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        hint: 'Địa Điểm Trả Hàng',
                        inputDecoration: const InputDecoration(
                            filled: true,
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: InputBorder.none,
                            fillColor: AppColors.transparent),
                      ),
                    )
                  ],
                ),
                ListTileService()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
              'Lấy hàng trong ${deliveryDetailController.selectedService == 1 ? '1' : '2'} ',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.black),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child:SingleChildScrollView(
                    child: Column(children: [
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
                          label:
                          'Tieu Chuan ',
                          value: "0"),
                      _radioButton(context, label: 'Hoa toc', value: "1"),
                      ElevatedButton(
                        style:ElevatedButton.styleFrom(
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
                      )
                    ]),
                  )
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
          builder: (deliveryDetailController) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: RadioListTile(
                          title: Text(label),
                          value: value,
                          groupValue: deliveryDetailController.selectedService
                              .toString(),
                          onChanged: (value) => deliveryDetailController
                              .onClickRadioButtonToSetService(value!)))
                ],
              ));
}

