import 'package:flutter/material.dart';
import 'package:flutter_address_from_latlng/flutter_address_from_latlng.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../utils/api_end_points.dart';
import 'dashboard_controller.dart';

class DeliveryDetailController extends GetxController {
  final pointToPickupInput = TextEditingController();
  final destinationInput = TextEditingController();
  final otherDetailTypeMerchandiseInput = TextEditingController();
  final DashboardController dashboardController =
      Get.put(DashboardController());
  RxString addressPickUp = ''.obs;

  // 0: standard 1: premium
  int selectedService = 0;

  //Type Selected Merchandise
  RxInt tag = 0.obs;
  bool isSelectedTypeOther = false;
  List<String> options = [
    'Thực Phẩm',
    'Điện Tử',
    'Dễ Vỡ',
    'Khác',
  ];

  //Unit params
  RxInt tagUnit = 0.obs;
  bool isSelectedUnit = false;
  List<String> unitOptions = [
    'centimets (cm)',
    'meters (m)',
  ];

  //Unit params of cm
  RxInt tagUnitCm = 0.obs;
  List<String> unitCmOptions = [
    'S',
    'M',
    'L',
    'XL',
  ];

  @override
  void onInit() {
    super.onInit();
  }

  Future<String> setCurrentLocation() async {
    if (!await dashboardController.handleLocationPermission()) return '';
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    return FlutterAddressFromLatLng().getFormattedAddress(
      latitude: position.latitude,
      longitude: position.longitude,
      googleApiKey: ApiEndPoints.API_Key,
    );
  }

  void onClickRadioButtonToSetService(String value) {
    selectedService = int.parse(value);
    update();
  }

  void onChangedValueTypeMerchandise(int value) {
    if (value == 3) {
      isSelectedTypeOther = true;
    } else {
      isSelectedTypeOther = false;
    }
    update();
  }

  void onChangedValueUnitMerchandise(int value) {
    if (value == 1) {
      isSelectedUnit = true;
    } else {
      isSelectedUnit = false;
    }
    update();
  }

  String onChangedPictureOfCMUnit(int value) {
    String result = '';
    if (value == 0) {
      result = 'packages/truck_delivery_customer/assets/images/size_s.jpg';
    } else if (value == 1) {
      result = 'packages/truck_delivery_customer/assets/images/size_m.jpg';
    } else if (value == 1) {
      result = 'packages/truck_delivery_customer/assets/images/size_l.jpg';
    } else {
      result = 'packages/truck_delivery_customer/assets/images/size_xl.jpg';
    }
    return result;
  }
}
