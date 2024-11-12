import 'package:tractian_challenge/features/asset/data/data_sources/location_remote_data_source.dart';
import 'package:tractian_challenge/features/asset/data/models/node.dart';
import 'package:tractian_challenge/features/asset/domain/repositories/I_location_repository.dart';

class LocationRepository implements ILocationRepository {
  final ILocationRemoteDataSource _remoteDataSource;

  LocationRepository({required ILocationRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  @override
  Future<List<Node>> getLocationsByCompanyId(String companyId) {
    return _remoteDataSource.getLocationsByCompanyId(companyId);
  }
}
