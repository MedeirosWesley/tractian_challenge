import 'package:tractian_challenge/features/asset/data/models/node.dart';
import 'package:tractian_challenge/features/asset/domain/repositories/I_location_repository.dart';

abstract class ILocaationUserCase {
  Future<List<Node>> getLocationsByCompanyId(String companyId);
}

class LocationUseCase implements ILocaationUserCase {
  final ILocationRepository _repository;

  LocationUseCase({required ILocationRepository repository})
      : _repository = repository;

  @override
  Future<List<Node>> getLocationsByCompanyId(String companyId) {
    return _repository.getLocationsByCompanyId(companyId);
  }
}
