import 'package:tractian_challenge/core/constats/api_end_points.dart';
import 'package:tractian_challenge/core/http_client/i_http_client_service.dart';
import 'package:tractian_challenge/features/asset/data/adapters/asset_adapter.dart';
import 'package:tractian_challenge/features/asset/data/models/node.dart';

abstract interface class IAssetRemoteDataSource {
  Future<List<Node>> getAssetsByCompanyId(String companyId);
}

class AssetRemoteDataSource implements IAssetRemoteDataSource {
  final IHttpClient _service;

  AssetRemoteDataSource({required IHttpClient service}) : _service = service;
  @override
  Future<List<Node>> getAssetsByCompanyId(String companyId) async {
    try {
      final response =
          await _service.get(ApiEndpoints.assetsByCompanyId(companyId));
      return AssetAdapter.fromJsonList(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
