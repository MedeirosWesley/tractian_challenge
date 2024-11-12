import 'package:tractian_challenge/features/asset/data/models/node.dart';
import 'package:tractian_challenge/features/asset/domain/repositories/i_asset_repository.dart';

abstract class IAssetUseCase {
  Future<List<Node>> getAssetsByCompanyId(String companyId);
}

class AssetUseCase implements IAssetUseCase {
  final IAssetRepository _repository;

  AssetUseCase({required IAssetRepository repository})
      : _repository = repository;

  @override
  Future<List<Node>> getAssetsByCompanyId(String companyId) {
    return _repository.getAssetsByCompanyId(companyId);
  }
}
