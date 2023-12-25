import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:truck_delivery_customer/constant/app_colors.dart';
import 'package:truck_delivery_customer/controller/deliveryDetailController.dart';
import 'package:truck_delivery_customer/wigets/headline.dart';
import '../utils/api_end_points.dart';
import '../wigets/floating_action_button.dart';
import '../wigets/list_tile_service.dart';
import '../wigets/places_autocomplete_field.dart';

class DeliveryDetail extends StatelessWidget {
  const DeliveryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return GetBuilder<DeliveryDetailController>(
        builder: (deliveryDetailController) => Form(
              key: _formKey,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.appbarBackground,
                  leading: const BackButton(),
                  title: const Text('Đơn Đặt Hàng'),
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
                                  controller: deliveryDetailController
                                      .pointToPickupInput,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  apiKey: ApiEndPoints.API_Key,
                                  hint: 'Địa Điểm Lấy Hàng',
                                  inputDecoration: const InputDecoration(
                                      filled: true,
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                    controller: deliveryDetailController
                                        .destinationInput,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    hint: 'Địa Điểm Trả Hàng',
                                    inputDecoration: const InputDecoration(
                                        filled: true,
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                                        value:
                                            deliveryDetailController.tag.value,
                                        onChanged: (val) => {
                                          deliveryDetailController.tag.value =
                                              val,
                                          deliveryDetailController
                                              .onChangedValueTypeMerchandise(
                                                  val)
                                        },
                                        choiceItems:
                                            C2Choice.listFrom<int, String>(
                                          source: deliveryDetailController
                                              .serviceOptions,
                                          value: (i, v) => i,
                                          label: (i, v) => v,
                                          tooltip: (i, v) => v,
                                        ),
                                        wrapped: true,
                                        choiceStyle: C2ChipStyle.filled(
                                          selectedStyle: const C2ChipStyle(
                                            backgroundColor:
                                                AppColors.appBottomBar,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(25),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
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
                                                    validator: (value) {
                                                      if (deliveryDetailController
                                                          .isSelectedTypeOther) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please enter some text';
                                                        }
                                                      }
                                                      return null;
                                                    },
                                                    controller:
                                                        deliveryDetailController
                                                            .otherDetailTypeMerchandiseInput,
                                                    autofocus: true,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide:
                                                            const BorderSide(
                                                          width: 0,
                                                          style:
                                                              BorderStyle.none,
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
                                    : Container(),
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
                                          value: deliveryDetailController
                                              .tagUnit.value,
                                          onChanged: (val) => {
                                            deliveryDetailController
                                                .tagUnit.value = val,
                                            deliveryDetailController
                                                .onChangedValueUnitMerchandise(
                                                    val)
                                          },
                                          choiceItems:
                                              C2Choice.listFrom<int, String>(
                                            source: deliveryDetailController
                                                .unitOptions,
                                            value: (i, v) => i,
                                            label: (i, v) => v,
                                            tooltip: (i, v) => v,
                                          ),
                                          wrapped: true,
                                          choiceStyle: C2ChipStyle.filled(
                                            selectedStyle: const C2ChipStyle(
                                              backgroundColor:
                                                  AppColors.appBottomBar,
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
                                  child: !deliveryDetailController
                                          .isSelectedUnit
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Obx(
                                                  () => ChipsChoice<int>.single(
                                                    value:
                                                        deliveryDetailController
                                                            .tagUnitCm.value,
                                                    onChanged: (val) => {
                                                      deliveryDetailController
                                                          .tagUnitCm
                                                          .value = val,
                                                    },
                                                    choiceItems: C2Choice
                                                        .listFrom<int, String>(
                                                      source:
                                                          deliveryDetailController
                                                              .unitCmOptions,
                                                      value: (i, v) => i,
                                                      label: (i, v) => v,
                                                      tooltip: (i, v) => v,
                                                    ),
                                                    wrapped: true,
                                                    choiceStyle:
                                                        C2ChipStyle.filled(
                                                      selectedStyle:
                                                          const C2ChipStyle(
                                                        backgroundColor:
                                                            AppColors
                                                                .appBottomBar,
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
                                                deliveryDetailController,
                                                labelLeading: "Chiều dài:",
                                                textEditingController:
                                                    deliveryDetailController
                                                        .lengthInput,
                                                labelTrailing: "m"),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            _rowTextFieldNumber(context,
                                                deliveryDetailController,
                                                labelLeading: "Chiều rộng:",
                                                textEditingController:
                                                    deliveryDetailController
                                                        .widthInput,
                                                labelTrailing: "m"),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            _rowTextFieldNumber(context,
                                                deliveryDetailController,
                                                labelLeading: "Chiều cao:",
                                                textEditingController:
                                                    deliveryDetailController
                                                        .heightInput,
                                                labelTrailing: "m"),
                                          ],
                                        ),
                                ),
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
                                    : Container(),
                                const Headline(
                                  title: 'Trọng Lượng',
                                  fontSizeTitle: 18,
                                ),
                                _rowTextFieldNumber(
                                    context, deliveryDetailController,
                                    labelLeading: "",
                                    textEditingController:
                                        deliveryDetailController.weightInput,
                                    labelTrailing: "kg"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  height: 10,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                                CheckboxListTile(
                                  value: deliveryDetailController
                                      .isReceiveCodForCustomer,
                                  onChanged: (bool? value) {
                                    deliveryDetailController
                                        .onChangedValueAddReceiveCodForCustomer(
                                            value!);
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
                                    style: TextStyle(
                                        color: AppColors.black, fontSize: 12),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                deliveryDetailController.isReceiveCodForCustomer
                                    ? _rowTextFieldNumber(
                                        context, deliveryDetailController,
                                        labelLeading: "",
                                        textEditingController:
                                            deliveryDetailController.receiveCod,
                                        labelTrailing: "vnd")
                                    : Container(),
                                const SizedBox(
                                  height: 10,
                                ),
                              ])),
                    ],
                  ),
                ),
                bottomNavigationBar: BottomAppBar(
                  height: deliveryDetailController.isOpenSubTotalCollapse.value
                      ? 200
                      : 140,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            5,
                            0,
                            deliveryDetailController
                                    .isOpenSubTotalCollapse.value
                                ? 5
                                : 10),
                        child: GestureDetector(
                          onTap: () {
                            deliveryDetailController.openSubtotal();
                          },
                          child: Container(
                            child: Row(
                              children: [
                                const Text(
                                  'Tổng cộng',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: AppColors.black),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                Text(
                                  '11.179.000đ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: AppColors.black),
                                ),
                                Icon(deliveryDetailController
                                        .isOpenSubTotalCollapse.value
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up)
                              ],
                            ),
                          ),
                        ),
                      ),
                      deliveryDetailController.isOpenSubTotalCollapse.value
                          ? Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 0, 20),
                              child: Column(
                                children: [
                                  Divider(
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Phí áp dụng',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 200,
                                      ),
                                      Text(
                                        '11.174.000đ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Đảm bảo hàng hóa',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 195,
                                      ),
                                      Text(
                                        '4.000đ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                          : Container(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: FloatingActionButtonForm(
                              iconData: Icons.turned_in_not,
                              label: "Tất cả",
                              heroTag: 'btn3',
                              url: '',
                              type: 'warning',
                            ),
                          ),
                          Flexible(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                primary: AppColors.appBottomBar,
                                padding: const EdgeInsets.all(16.0),
                                minimumSize: const Size.fromHeight(60), // NEW
                              ),
                              onPressed: () {
                                if (deliveryDetailController
                                        .pointToPickupInput.text.isEmpty ||
                                    deliveryDetailController
                                        .destinationInput.text.isEmpty) {
                                  Get.snackbar(
                                    "",
                                    "",
                                    backgroundColor: Colors.yellow,
                                    duration: const Duration(seconds: 2),
                                    icon: const Icon(Icons.warning_amber),
                                    titleText: const SizedBox(
                                      height: 0,
                                    ),
                                    messageText: Text(
                                      "Hãy điền thông tin địa chỉ bạn muốn chúng tôi lấy hàng và giao hàng.",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                } else {
                                  if (_formKey.currentState!.validate()) {
                                    print('zoooooo');
// deliveryDetailController.bookingOrder();
                                  } else {
                                    Get.snackbar(
                                      "",
                                      "",
                                      backgroundColor: Colors.yellow,
                                      duration: const Duration(seconds: 2),
                                      icon: const Icon(Icons.warning_amber),
                                      titleText: const SizedBox(
                                        height: 0,
                                      ),
                                      messageText: Text(
                                        "Hãy điền các thông tin cần thiết trước khi đặt đơn hàng.",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const Text(
                                'Kiểm tra đơn hàng',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget _rowTextFieldNumber(
          BuildContext context, DeliveryDetailController controller,
          {required String labelLeading,
          required TextEditingController textEditingController,
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
                child: SizedBox(
                  width: 100,
                  height: 60,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.isError = true;
                        return '';
                      }
                      return null;
                    },
                    controller: textEditingController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      errorText: null,
                      errorStyle: TextStyle(height: 0),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: controller.isError ? 5 : 0,
                          color: controller.isError ? Colors.red : Colors.green,
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
