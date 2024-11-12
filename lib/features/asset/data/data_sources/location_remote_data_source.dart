import 'package:tractian_challenge/core/constats/api_end_points.dart';
import 'package:tractian_challenge/core/http_client/i_http_client_service.dart';
import 'package:tractian_challenge/features/asset/data/adapters/location_adapter.dart';
import 'package:tractian_challenge/features/asset/data/models/node.dart';

abstract class ILocationRemoteDataSource {
  Future<List<Node>> getLocationsByCompanyId(String companyId);
}

class LocationRemoteDataSource implements ILocationRemoteDataSource {
  final IHttpClient _service;

  LocationRemoteDataSource({required IHttpClient service}) : _service = service;

  @override
  Future<List<Node>> getLocationsByCompanyId(String companyId) async {
    try {
      final response =
          await _service.get(ApiEndpoints.locationsByCompanyId(companyId));
      return LocationAdapter.fromJsonList(response.data);
    } catch (_) {
      rethrow;
    }
  }
}
