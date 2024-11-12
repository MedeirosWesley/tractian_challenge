import 'package:tractian_challenge/features/asset/data/models/node.dart';

abstract class ILocationRepository {
  Future<List<Node>> getLocationsByCompanyId(String companyId);
}
