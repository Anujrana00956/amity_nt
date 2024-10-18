import 'package:amity_nt/amity/features/domain/entities/models/login_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/response_model.dart';

class Repository{

static Future<LoginResponse> authLogin(
    {required String email,
    required String password,
    required String deviceToken}) async {
  LoginResponse? loginResponse;
  return loginResponse!;
}
  // Future<ResponseModel> logout() async {
  //    LoginResponse? loginResponse;
  //   return !;
  // }
}
