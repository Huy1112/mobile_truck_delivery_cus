import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:truck_delivery_customer/constant/app_colors.dart';
import 'package:truck_delivery_customer/controller/deliveryDetailController.dart';
import 'package:truck_delivery_customer/wigets/headline.dart';
import '../utils/api_end_points.dart';
import '../wigets/places_autocomplete_field.dart';

class DeliveryDetail extends StatelessWidget {
  const DeliveryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final DeliveryDetailController deliveryDetailController =
        Get.put(DeliveryDetailController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appbarBackground,
          leading: const BackButton(),
          title: Text('Chi Tiết Đơn Đặt Hàng'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(16),
                color: AppColors.white,
                shadowColor: AppColors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          controller:
                              deliveryDetailController.pointToPickupInput,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
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
                            controller:
                                deliveryDetailController.destinationInput,
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            hint: 'Địa Điểm Trả Hàng',
                            inputDecoration: const InputDecoration(
                                filled: true,
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                                fillColor: AppColors.transparent),
                          ),
                        )
                      ],
                    ),
                    const ListTileService(),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Headline(
                        title: 'Loại Hàng Hóa',
                        fontSizeTitle: 18,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Obx(
                          () => ChipsChoice<int>.single(
                            value: deliveryDetailController.tag.value,
                            onChanged: (val) => {
                              deliveryDetailController.tag.value = val,
                              deliveryDetailController
                                  .onChangedValueTypeMerchandise(val)
                            },
                            choiceItems: C2Choice.listFrom<int, String>(
                              source: deliveryDetailController.options,
                              value: (i, v) => i,
                              label: (i, v) => v,
                              tooltip: (i, v) => v,
                            ),
                            wrapped: true,
                            choiceStyle: C2ChipStyle.filled(
                              selectedStyle: const C2ChipStyle(
                                backgroundColor: AppColors.appBottomBar,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                            ),
                          ),
                        )),
                    GetBuilder<DeliveryDetailController>(
                        builder: (deliveryDetailController) =>
                            deliveryDetailController.isSelectedTypeOther
                                ? Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Chi tiết mặt hàng: '),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: TextFormField(
                                                controller: deliveryDetailController
                                                    .otherDetailTypeMerchandiseInput,
                                                autofocus: true,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                    ),
                                                  ),
                                                  hintText:
                                                      'Ví Dụ: Sách, Đồ chơi, Cây',
                                                ),
                                                onChanged: (value) {
                                                  // formData.phone = value;
                                                },
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : Container()),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Headline(
                        title: 'Kích Thước',
                        fontSizeTitle: 18,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text('Đơn vị :'),
                          Obx(
                            () => ChipsChoice<int>.single(
                              value: deliveryDetailController.tagUnit.value,
                              onChanged: (val) => {
                                deliveryDetailController.tagUnit.value = val,
                                deliveryDetailController
                                    .onChangedValueUnitMerchandise(val)
                              },
                              choiceItems: C2Choice.listFrom<int, String>(
                                source: deliveryDetailController.unitOptions,
                                value: (i, v) => i,
                                label: (i, v) => v,
                                tooltip: (i, v) => v,
                              ),
                              wrapped: true,
                              choiceStyle: C2ChipStyle.filled(
                                selectedStyle: const C2ChipStyle(
                                  backgroundColor: AppColors.appBottomBar,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: GetBuilder<DeliveryDetailController>(
                        builder: (deliveryDetailController) =>
                            !deliveryDetailController.isSelectedUnit
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Obx(
                                            () => ChipsChoice<int>.single(
                                              value: deliveryDetailController
                                                  .tagUnitCm.value,
                                              onChanged: (val) => {
                                                deliveryDetailController
                                                    .tagUnitCm.value = val,
                                              },
                                              choiceItems: C2Choice.listFrom<
                                                  int, String>(
                                                source: deliveryDetailController
                                                    .unitCmOptions,
                                                value: (i, v) => i,
                                                label: (i, v) => v,
                                                tooltip: (i, v) => v,
                                              ),
                                              wrapped: true,
                                              choiceStyle: C2ChipStyle.filled(
                                                selectedStyle:
                                                    const C2ChipStyle(
                                                  backgroundColor:
                                                      AppColors.appBottomBar,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Chiều dài:    "),
                                          Container(
                                            width: 100,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ], // Only numbers can be entered
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text("Chiều rộng:  "),
                                          Container(
                                            width: 100,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                              ),
                                              keyboardType:
                                              TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ], // Only numbers can be entered
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text("Chiều cao:    "),
                                          Container(
                                            width: 100,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                              ),
                                              keyboardType:
                                              TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ], // Only numbers can be entered
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                      ),
                    ),
                    GetBuilder<DeliveryDetailController>(
                        builder: (deliveryDetailController) =>
                            deliveryDetailController.tagUnit.value == 0
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Obx(() => Container(
                                            width: 379,
                                            height: 300,
                                            child: Image.asset(
                                              fit: BoxFit.cover,
                                              deliveryDetailController
                                                  .onChangedPictureOfCMUnit(
                                                      deliveryDetailController
                                                          .tagUnitCm.value),
                                              scale: 2.5,
                                            ),
                                          )),
                                    ],
                                  )
                                : Container()),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Headline(
                        title: 'Trọng Lượng',
                        fontSizeTitle: 18,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
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
                  fontSize: 16,
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
