import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/features/asset/data/adapters/location_adapter.dart';
import 'package:tractian_challenge/features/asset/data/data_sources/location_remote_data_source.dart';

import 'package:tractian_challenge/features/asset/data/repositories/location_repository.dart';

class MockLocationRemoteDataSource extends Mock
    implements ILocationRemoteDataSource {}

void main() {
  late LocationRepository repository;
  late MockLocationRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockLocationRemoteDataSource();
    repository = LocationRepository(remoteDataSource: mockRemoteDataSource);
  });

  group('getLocationsByCompanyId', () {
    const companyId = '662fd0ee639069143a8fc387';
    final nodes = LocationAdapter.fromJsonList([
      {
        "id": "656a07b3f2d4a1001e2144bf",
        "name": "CHARCOAL STORAGE SECTOR",
        "parentId": "65674204664c41001e91ecb4"
      },
      {
        "id": "656733611f4664001f295dd0",
        "name": "Empty Machine house",
        "parentId": null
      },
      {
        "id": "656733b1664c41001e91d9ed",
        "name": "Machinery house",
        "parentId": null
      },
      {
        "id": "65674204664c41001e91ecb4",
        "name": "PRODUCTION AREA - RAW MATERIAL",
        "parentId": null
      }
    ]);

    test(
        'should return list of nodes when the call to remote data source is successful',
        () async {
      when(() => mockRemoteDataSource.getLocationsByCompanyId(companyId))
          .thenAnswer((_) async => nodes);

      final result = await repository.getLocationsByCompanyId(companyId);

      expect(result, equals(nodes));
      verify(() => mockRemoteDataSource.getLocationsByCompanyId(companyId));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test(
        'should throw an exception when the call to remote data source is unsuccessful',
        () async {
      when(() => mockRemoteDataSource.getLocationsByCompanyId(any()))
          .thenAnswer((_) async => throw const HttpException(''));

      final call = repository.getLocationsByCompanyId(companyId);

      expect(() => call, throwsA(isA<HttpException>()));
      verify(() => mockRemoteDataSource.getLocationsByCompanyId(companyId));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
