class ApiEndPoints {
  static final String baseUrl = 'http://192.168.1.3:8080/customerMobile';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String loginEmail = '/auth';
}