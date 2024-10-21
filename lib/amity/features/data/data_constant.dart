class DataConstants {
  /// Base url for amity api hit
  static const String baseUrl = 'https://tagstaff.us/api/v1/';

  /// Api endpoints of amity app
  ///
  /// Api to get nurse profile
  static const String getUserProfile = 'nurse';

  /// Api to sync availability days
  static const String sendAvailability = 'availability/sync';

  /// Api to get notification list from job list api
  static const String eligibleJobs = 'jobs/eligible';
}
