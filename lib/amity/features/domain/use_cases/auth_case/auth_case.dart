import 'package:amity_nt/amity/features/domain/repositories/repo.dart';
import 'package:amity_nt/amity/features/domain/entities/models/login_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/response_model.dart';

class AuthCase {
    final Repository _repository = Repository();

  
  // Logout Auth Cases
//  static Future<ResponseModel> logout() async {
//     return await Repository.logout();
//   }
 static Future<ResponseModel> sendOtp(
          {required String email, required bool isLoading}) async =>
      await Repository.sendOtp(
        email: email,
        isLoading: isLoading,
      );
}
