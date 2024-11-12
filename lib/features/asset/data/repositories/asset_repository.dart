import 'package:tractian_challenge/features/asset/data/data_sources/asset_remote_data_source.dart';
import 'package:tractian_challenge/features/asset/data/models/node.dart';
import 'package:tractian_challenge/features/asset/domain/repositories/i_asset_repository.dart';

class AssetRepository implements IAssetRepository {
  final IAssetRemoteDataSource _remoteDataSource;

  AssetRepository({required IAssetRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  @override
  Future<List<Node>> getAssetsByCompanyId(String companyId) {
    return _remoteDataSource.getAssetsByCompanyId(companyId);
  }
}
