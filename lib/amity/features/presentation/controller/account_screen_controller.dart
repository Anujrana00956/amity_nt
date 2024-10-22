import 'package:amity_nt/amity/app/core/utils/utility.dart';
import 'package:amity_nt/amity/features/data/data_sources/local/hive_manager.dart';
import 'package:amity_nt/amity/features/domain/repositories/repo.dart';
import 'package:amity_nt/amity/features/presentation/controller/login_screen_controller.dart';
import 'package:get/get.dart';

class AccountScreenController extends GetxController {
  final _hivemnager = HiveManager();
  final _repository = Repository();

  // Logout API
  logoutBottonTapped() async {
     await _repository.logout();
   
  }

  Future<void> uploadDocOnWeb() async {
    await _repository.getWebLoginToken(
      isLoading: true,
    );
  }
}
