// coverage:ignore-file
class ResponseModel {
  ResponseModel(
      {required this.data,
      required this.hasError,
      this.errorCode,
      this.message,
      this.statusCode});
  final String data;
  final bool hasError;
  final int? errorCode;
  final String? message;
  final int? statusCode;
}
