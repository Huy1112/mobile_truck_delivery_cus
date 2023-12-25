class ApiEndPoints {
  static final String baseUrl = 'http://192.168.1.3:8080/customerMobile';
  static const String API_Key = 'AIzaSyCjpmMPrVGiBbfK4m5vip7SUU1sOJ4hQEc';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String loginEmail = '/auth';
  final String bookingOrder = '/bookingOrder';
}