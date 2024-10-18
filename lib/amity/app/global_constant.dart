class AppConstants {
  static dynamic liscenseItems = [];
  static dynamic reasonItems = [];
  static dynamic serviceItems = [];
  static dynamic visitItems = [];
  static String fcmToken = '';

  static String googleMapApi = 'AIzaSyBrDJEHY1D5bloa83uVvJN4xo2cXkWVzyE';
}

class DropDownHelper {
  DropDownHelper({
    required this.id,
    required this.name,
  });
  final int id;
  final String name;
}
