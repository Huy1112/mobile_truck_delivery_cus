import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_delivery_customer/wigets/list_tile_service.dart';
import '../constant/app_colors.dart';
import '../controller/confirm_order_page_controller.dart';
import '../wigets/floating_action_button.dart';

class ConfirmOrderPage extends StatelessWidget {
  const ConfirmOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey1 = GlobalKey<FormState>();
    Get.lazyPut(() => ConfirmOrderController(order: Get.arguments['order']));

    // return Container();
    return GetBuilder<ConfirmOrderController>(
        builder: (controller) => Form(
              key: _formKey1,
              child: Scaffold(
                backgroundColor: AppColors.grey400,
                appBar: AppBar(
                  backgroundColor: AppColors.appbarBackground,
                  leading: const BackButton(),
                  title: const Text('Đơn Đặt Hàng'),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        color: AppColors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Text(
                                "Chi tiết đơn hàng",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: AppColors.black),
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.my_location,
                                    size: 25,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                              title: Text(
                                "Người gửi",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Pham huy + 0767029031"),
                                  Text(controller.order.pointToPickup)
                                ],
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                size: 25,
                                color: AppColors.black,
                              ),
                            ),
                            Divider(),
                            ListTile(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 25,
                                    color: AppColors.blueAccent,
                                  ),
                                ],
                              ),
                              title: Text(
                                "Người nhận",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Pham huy + 0767029031"),
                                  Text(controller.order.destination)
                                ],
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                size: 25,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        color: AppColors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Text(
                                "Lựa chọn giao đơn",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: AppColors.black),
                              ),
                            ),
                            ListTile(
                              enabled: false,
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.local_shipping,
                                    size: 25,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              title: Text(
                                'Lấy hàng trong ${controller.order.selectedService == 1 ? ' 1 - 2 ngày.' : '3 - 4 ngày.'} ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(controller.order.selectedService == 1
                                      ? 'Hỏa Tốc'
                                      : 'Tiêu Chuẩn'),
                                ],
                              ),
                            ),
                            ListTile(
                              enabled: false,
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.local_mall,
                                    size: 25,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '• ${controller.order.length} x ${controller.order.width} x ${controller.order.height} ${controller.order.unitMerchandise}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black),
                                  ),
                                  Text(
                                    '• ${controller.order.weight} kg',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black),
                                  ),
                                  Text(
                                    '• ${controller.order.typeMerchandise}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        color: AppColors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Text(
                                "Chi tiết thanh toán",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: AppColors.black),
                              ),
                            ),
                            ListTileService(
                                haveIcon: true,
                                leadingIcon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.payment,
                                      size: 25,
                                      color: AppColors.black,
                                    ),
                                  ],
                                ),
                                content: Container(
                                  margin: const EdgeInsets.all(0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              15, 10, 0, 10),
                                          child: Text(
                                            'Chọn phương thức thanh toán',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.black),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25),
                                          child: Text(
                                            'Các phương thức được liên kết',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.black),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(15, 5, 0, 0),
                                          child: Column(
                                            children: [
                                              _radioButton(context,
                                                  label:
                                                      'Người gửi trả tiền mặt',
                                                  value: "0"),
                                              _radioButton(context,
                                                  label:
                                                      'Người nhận trả tiền mặt',
                                                  value: "1"),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25),
                                          child: Text(
                                            'Thêm phương thức khác',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.black),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(15, 5, 0, 0),
                                          child: Column(
                                            children: [
                                              _radioButton(context,
                                                  label: 'MoMo', value: "0"),
                                              _radioButton(context,
                                                  label: 'Thẻ.', value: "1"),
                                              _radioButton(context,
                                                  label: 'Zalopay.',
                                                  value: "2"),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: AppColors.appBottomBar,
                                              minimumSize:
                                                  const Size.fromHeight(
                                                      50), // NEW
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
                                texttitle: Text(
                                  '${controller.payerOptions[controller.tagPayer]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black),
                                ),
                                heightBottomsheet: 0.55),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                            'Lưu ý trước khi giao hàng X Không hỗ trợ giao nhận các loại thư từ, tài liệu, hợp đồng và/ hoặc các hàng hóa khác thuộc danh mục không được phép giao nhận được công bố tại website của Grab. Đặc biệt, giao và nhận hàng hóa bị cấm là hành vi vi phạm pháp luật. Trường hợp nghi ngờ bưu gửi có dấu hiệu vi phạm, Grab và/hoặc đối tác tài xế có quyền giao nộp bưu gửi đó cho cơ quan chức năng để xử lý. Bạn sẽ phải chịu toàn bộ trách nhiệm pháp lý liên quan đến bưu gửi vi phạm và tài khoản trên Ứng dụng Grab của bạn sẽ bị khóa vĩnh viễn.'),
                      )
                    ],
                  ),
                ),
                bottomNavigationBar: BottomAppBar(
                  height: controller.isOpenSubTotalCollapse ? 200 : 140,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0,
                            controller.isOpenSubTotalCollapse ? 5 : 10),
                        child: GestureDetector(
                          onTap: () {
                            controller.openSubtotal();
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
                                Icon(controller.isOpenSubTotalCollapse
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up)
                              ],
                            ),
                          ),
                        ),
                      ),
                      controller.isOpenSubTotalCollapse
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
                              onPressed: () {},
                              child: const Text(
                                'Đặt đơn hàng',
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

  Widget _radioButton(BuildContext context,
          {required String label, required String value}) =>
      GetBuilder<ConfirmOrderController>(
          builder: (confirmOrderController) => RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                label,
                style: TextStyle(fontSize: 18),
              ),
              value: value,
              groupValue: "1",
              onChanged: (value) => {}));
}
