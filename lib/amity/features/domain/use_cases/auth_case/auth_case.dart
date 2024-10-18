import 'package:amity_nt/amity/features/data/repositories/repo.dart';
import 'package:amity_nt/amity/features/domain/entities/models/login_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/response_model.dart';

class AuthCase {
 static Future<LoginResponse> authLogin({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    return await Repository.authLogin(
      email: email,
      password: password,
      deviceToken: deviceToken,
    );
  }

    // Logout Auth Cases
//  static Future<ResponseModel> logout() async {
//     return await Repository.logout();
//   }
}