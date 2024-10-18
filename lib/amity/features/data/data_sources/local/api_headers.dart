class ApiHeaders {
 ApiHeaders._internalConstructor();

  static final ApiHeaders _instance = ApiHeaders._internalConstructor();

  factory ApiHeaders() {
    return _instance;
  }
  Map<String, String> headers = {
    "Content-Type": "application/json",
    'Accept': "application/json"
  };

}