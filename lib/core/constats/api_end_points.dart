class ApiEndpoints {
  static const String baseUrl = 'https://fake-api.tractian.com';

  static const String companies = '$baseUrl/companies';

  static String locationsByCompanyId(String companyId) =>
      '$companies/$companyId/locations';
  static String assetsByCompanyId(String companyId) =>
      '$companies/$companyId/assets';
}
