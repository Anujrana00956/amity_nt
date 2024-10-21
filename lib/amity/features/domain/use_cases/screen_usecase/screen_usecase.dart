import 'package:amity_nt/amity/features/domain/entities/models/dropdown_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/get_profile_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/job_list_response.dart';
import 'package:amity_nt/amity/features/domain/repositories/repo.dart';

class ScreenUsecase {
  final Repository _repository = Repository();
  static Future<DropDownResponse> getDropdown() async {
    return await Repository.getDropdown();
  }

  Future<GetUserProfileResponse> getUserProfile({
    required bool isLoading,
  }) async =>
      await _repository.getUserProfile(
        isLoading: isLoading,
      );

  Future<JobListResponse> manageJobs({
    required String fromDate,
    required String toDate,
    required bool isLoading,
    required String status,
  }) async =>
      await _repository.manageJobs(
        fromDate: fromDate,
        toDate: toDate,
        isLoading: isLoading,
        status: status,
      );
}
