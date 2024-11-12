import 'package:tractian_challenge/features/asset/data/models/node.dart';

abstract class IAssetRepository {
  Future<List<Node>> getAssetsByCompanyId(String companyId);
}
