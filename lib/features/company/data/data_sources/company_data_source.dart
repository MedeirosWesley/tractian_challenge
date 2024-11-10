import 'package:tractian_challenge/core/http_client/i_http_client_service.dart';
import 'package:tractian_challenge/core/constats/api_end_points.dart';
import 'package:tractian_challenge/features/company/data/adapters/company_adapter.dart';
import 'package:tractian_challenge/features/company/data/models/company_model.dart';

abstract interface class ICompanyRemoteDataSource {
  Future<List<Company>> getCompanies();
}

class CompanyRemoteDataSource implements ICompanyRemoteDataSource {
  final IHttpClient _service;

  CompanyRemoteDataSource({required IHttpClient service}) : _service = service;
  @override
  Future<List<Company>> getCompanies() async {
    try {
      final response = await _service.get(ApiEndpoints.companies);
      return CompanyAdapter.fromJsonList(response.data);
    } catch (_) {
      rethrow;
    }
  }
}
