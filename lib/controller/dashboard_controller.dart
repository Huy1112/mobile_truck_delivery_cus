import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final _selectedIndex = 0.obs;

  get getIndex => _selectedIndex.value;


  void onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('', 'Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('','Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('','Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }
}