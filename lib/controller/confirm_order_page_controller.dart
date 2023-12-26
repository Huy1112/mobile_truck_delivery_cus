import 'package:get/get.dart';
import 'package:truck_delivery_customer/models/order_form.dart';

class ConfirmOrderController extends GetxController {
  final OrderForm order;

  ConfirmOrderController({required this.order});

  int tagPayer = 0;
  List<String> payerOptions = [
    'Người nhận',
    'Người gửi',
  ];
  bool isOpenSubTotalCollapse = false;


  void openSubtotal() {
    if (isOpenSubTotalCollapse == false) {
      isOpenSubTotalCollapse = true;
    } else {
      isOpenSubTotalCollapse = false;
    }
    update();
  }
}