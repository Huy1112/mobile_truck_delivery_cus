import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:truck_delivery_customer/constant/app_colors.dart';
import 'package:truck_delivery_customer/controller/deliveryDetailController.dart';
import 'package:truck_delivery_customer/wigets/headline.dart';
import '../utils/api_end_points.dart';
import '../wigets/list_tile_service.dart';
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
        title: const Text('Chi Tiết Đơn Đặt Hàng'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              margin: const EdgeInsets.all(13),
              color: AppColors.white,
              shadowColor: AppColors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
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
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          hint: 'Địa Điểm Trả Hàng',
                          inputDecoration: const InputDecoration(
                              filled: true,
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                              fillColor: AppColors.transparent),
                        ),
                      ),
                    ],
                  ),
                  const ListTileService(),
                ],
              ),
            ),
            Card(
                margin: const EdgeInsets.all(13),
                color: AppColors.white,
                shadowColor: AppColors.black,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Headline(
                        title: 'Loại Hàng Hóa',
                        fontSizeTitle: 18,
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
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Chi tiết mặt hàng: '),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: TextFormField(
                                                  controller:
                                                      deliveryDetailController
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
                                                      borderSide:
                                                          const BorderSide(
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
                      const Divider(
                        height: 20,
                        indent: 0,
                        endIndent: 0,
                      ),
                      const Headline(
                        title: 'Kích Thước',
                        fontSizeTitle: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            const Text(
                              'Đơn vị :',
                              style: TextStyle(fontSize: 16),
                            ),
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
                        padding: const EdgeInsets.only(left: 20),
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
                                                  source:
                                                      deliveryDetailController
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
                                        _rowTextFieldNumber(context,
                                            labelLeading: "Chiều dài:",
                                            controller: deliveryDetailController
                                                .lengthInput,
                                            labelTrailing: "m"),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        _rowTextFieldNumber(context,
                                            labelLeading: "Chiều rộng:",
                                            controller: deliveryDetailController
                                                .widthInput,
                                            labelTrailing: "m"),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        _rowTextFieldNumber(context,
                                            labelLeading: "Chiều cao:",
                                            controller: deliveryDetailController
                                                .heightInput,
                                            labelTrailing: "m"),
                                      ],
                                    ),
                        ),
                      ),
                      GetBuilder<DeliveryDetailController>(
                          builder: (deliveryDetailController) =>
                              deliveryDetailController.tagUnit.value == 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                      const Headline(
                        title: 'Trọng Lượng',
                        fontSizeTitle: 18,
                      ),
                      _rowTextFieldNumber(context,
                          labelLeading: "",
                          controller: deliveryDetailController.weightInput,
                          labelTrailing: "kg"),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 10,
                        indent: 0,
                        endIndent: 0,
                      ),
                      GetBuilder<DeliveryDetailController>(
                        builder: (deliveryDetailController) => CheckboxListTile(
                          value:
                              deliveryDetailController.isReceiveCodForCustomer,
                          onChanged: (bool? value) {
                            deliveryDetailController
                                .onChangedValueAddReceiveCodForCustomer(value!);
                          },
                          tileColor: AppColors.white,
                          title: const Text(
                            'Thu hộ Tiền cod từ người nhận.',
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            '(Tài xế giữ tiền)',
                            style:
                                TextStyle(color: AppColors.black, fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<DeliveryDetailController>(
                          builder: (deliveryDetailController) =>
                              deliveryDetailController.isReceiveCodForCustomer
                                  ? _rowTextFieldNumber(context,
                                      labelLeading: "",
                                      controller:
                                          deliveryDetailController.receiveCod,
                                      labelTrailing: "vnd")
                                  : Container()),
                      const SizedBox(
                        height: 10,
                      ),
                    ])),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          primary: AppColors.appBottomBar,
          padding: const EdgeInsets.all(16.0),
          minimumSize: const Size.fromHeight(60), // NEW
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text(
          'Đặt Đơn Hàng',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
        ),
      ),
    );
  }

  Widget _rowTextFieldNumber(BuildContext context,
          {required String labelLeading,
          required TextEditingController controller,
          required String labelTrailing}) =>
      Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Row(
            children: [
              Text(
                labelLeading,
                style: const TextStyle(fontSize: 14),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: 100,
                  height: 50,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
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
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  labelTrailing,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ));
}
