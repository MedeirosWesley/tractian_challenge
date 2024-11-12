import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/features/asset/data/adapters/asset_adapter.dart';
import 'package:tractian_challenge/features/asset/data/data_sources/asset_remote_data_source.dart';

import 'package:tractian_challenge/features/asset/data/repositories/asset_repository.dart';

class MockAssetRemoteDataSource extends Mock
    implements IAssetRemoteDataSource {}

void main() {
  late AssetRepository repository;
  late MockAssetRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockAssetRemoteDataSource();
    repository = AssetRepository(remoteDataSource: mockRemoteDataSource);
  });

  group('getAssetsByCompanyId', () {
    const companyId = '662fd0ee639069143a8fc387';
    final nodes = AssetAdapter.fromJsonList([
      {
        "id": "656a07bbf2d4a1001e2144c2",
        "locationId": "656a07b3f2d4a1001e2144bf",
        "name": "CONVEYOR BELT ASSEMBLY",
        "parentId": null,
        "sensorType": null,
        "status": null
      },
      {
        "gatewayId": "QHI640",
        "id": "656734821f4664001f296973",
        "locationId": null,
        "name": "Fan - External",
        "parentId": null,
        "sensorId": "MTC052",
        "sensorType": "energy",
        "status": "operating"
      },
    ]);

    test(
        'should return list of nodes when the call to remote data source is successful',
        () async {
      when(() => mockRemoteDataSource.getAssetsByCompanyId(companyId))
          .thenAnswer((_) async => nodes);

      final result = await repository.getAssetsByCompanyId(companyId);

      expect(result, equals(nodes));
      verify(() => mockRemoteDataSource.getAssetsByCompanyId(companyId));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test(
        'should throw an exception when the call to remote data source is unsuccessful',
        () async {
      when(() => mockRemoteDataSource.getAssetsByCompanyId(any()))
          .thenAnswer((_) async => throw const HttpException(''));

      final call = repository.getAssetsByCompanyId(companyId);

      expect(() => call, throwsA(isA<HttpException>()));
      verify(() => mockRemoteDataSource.getAssetsByCompanyId(companyId));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
