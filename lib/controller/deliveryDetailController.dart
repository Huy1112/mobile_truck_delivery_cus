import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_address_from_latlng/flutter_address_from_latlng.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:truck_delivery_customer/models/order_form.dart';

import '../models/route.dart';
import '../utils/api_end_points.dart';
import 'dashboard_controller.dart';
import 'package:http/http.dart' as http;

class DeliveryDetailController extends GetxController {
  final pointToPickupInput = TextEditingController();
  final destinationInput = TextEditingController();

  final otherDetailTypeMerchandiseInput = TextEditingController();

  final lengthInput = TextEditingController();
  final widthInput = TextEditingController();
  final heightInput = TextEditingController();
  final weightInput = TextEditingController();
  final receiveCod = TextEditingController();

  final DashboardController dashboardController =
      Get.put(DashboardController());

  bool isError = false;
  bool isOpenSubTotalCollapse = false;

  // 0: standard 1: premium
  int selectedService = 0;

  //Type Selected Merchandise
  int tag = 0;
  bool isSelectedTypeOther = false;
  List<String> serviceOptions = [
    'Thực Phẩm',
    'Điện Tử',
    'Dễ Vỡ',
    'Khác',
  ];

  //Unit params
  int tagUnit = 0;

  // 0: centimets 1: meters
  // true: meters false: centimets
  bool isSelectedUnit = false;
  List<String> unitOptions = [
    'centimets (cm)',
    'meters (m)',
  ];

  //Unit params of cm
  int tagUnitCm = 0;
  List<String> unitCmOptions = [
    'S',
    'M',
    'L',
    'XL',
  ];

  bool isReceiveCodForCustomer = false;


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

  void onChangedValueUnitMerchandise(int value) {
    tagUnit = value;

    if (value == 1) {
      isSelectedUnit = true;
    } else {
      isSelectedUnit = false;
    }
    update();
  }

  void onchangeTagServices(int value) {
    tag = value;
    if (value == 3) {
      isSelectedTypeOther = true;
    } else {
      isSelectedTypeOther = false;
    }
    update();
  }

  void onChangedTagUnit(int value) {
    tagUnitCm = value;
    update();
  }

  String onChangedPictureOfCMUnit(int value) {
    String result = '';
    if (value == 0) {
      result = 'packages/truck_delivery_customer/assets/images/size_s.jpg';
    } else if (value == 1) {
      result = 'packages/truck_delivery_customer/assets/images/size_m.jpg';
    } else if (value == 2) {
      result = 'packages/truck_delivery_customer/assets/images/size_l.jpg';
    } else {
      result = 'packages/truck_delivery_customer/assets/images/size_xl.jpg';
    }
    return result;
  }

  void onChangedValueAddReceiveCodForCustomer(bool value) {
    if (value) {
      isReceiveCodForCustomer = true;
    } else {
      isReceiveCodForCustomer = false;
    }
    update();
  }

  Future<void> bookingOrder() async {
    checkUnitCmAndSetValueForMerchandise();
    OrderForm orderForm = OrderForm(
      pointToPickup: pointToPickupInput.text,
      destination: destinationInput.text,
      selectedService: selectedService,
      typeMerchandise: tag != 3
          ? serviceOptions[tag]
          : otherDetailTypeMerchandiseInput.text,
      unitMerchandise: unitOptions[tagUnit],
      length: int.parse(lengthInput.text),
      width: int.parse(widthInput.text),
      height: int.parse(heightInput.text),
      weight: int.parse(weightInput.text),
      receiveCod:
          isReceiveCodForCustomer == true ? int.parse(receiveCod.text) : 0,
    );

    print(orderForm.toJson());

    Get.toNamed(Routes.confirmOrderPage, arguments: {"order": orderForm});

  }

  void checkUnitCmAndSetValueForMerchandise() {
    if (!isSelectedUnit) {
      switch (tagUnitCm) {
        case 0:
          lengthInput.text = "25";
          widthInput.text = "20";
          heightInput.text = "20";
          break;
        case 1:
          lengthInput.text = "50";
          widthInput.text = "50";
          heightInput.text = "40";
          break;
        case 2:
          lengthInput.text = "70";
          widthInput.text = "60";
          heightInput.text = "60";
          break;
        case 3:
          lengthInput.text = "170";
          widthInput.text = "120";
          heightInput.text = "100";
          break;
        default:
          print('error');
          lengthInput.text = "";
          widthInput.text = "";
          heightInput.text = "";
      }
    }
  }

  void openSubtotal() {
    if (isOpenSubTotalCollapse == false) {
      isOpenSubTotalCollapse = true;
    } else {
      isOpenSubTotalCollapse = false;
    }
    update();
  }
}
