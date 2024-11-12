import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/core/constats/api_end_points.dart';
import 'package:tractian_challenge/core/http_client/i_http_client_service.dart';
import 'package:tractian_challenge/core/http_client/response_data.dart';
import 'package:tractian_challenge/features/asset/data/data_sources/location_remote_data_source.dart';
import 'package:tractian_challenge/features/asset/data/models/node.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late LocationRemoteDataSource dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = LocationRemoteDataSource(service: mockHttpClient);
  });

  group('getLocationsByCompanyId', () {
    const companyId = '662fd0ee639069143a8fc387';
    final apiUrl = ApiEndpoints.locationsByCompanyId(companyId);
    final responseJson = [
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
    ];

    test('should return a list of Nodes when the call to the API is successful',
        () async {
      when(() => mockHttpClient.get(apiUrl)).thenAnswer((_) async =>
          ResponseData(data: responseJson, statusCode: 200, url: apiUrl));

      final result = await dataSource.getLocationsByCompanyId(companyId);

      expect(result, isA<List<Node>>());
      verify(() => mockHttpClient.get(apiUrl));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test('should throw an exception when the call to the API is unsuccessful',
        () async {
      when(() => mockHttpClient.get(apiUrl))
          .thenAnswer((_) async => throw const HttpException(''));

      final call = dataSource.getLocationsByCompanyId(companyId);

      expect(() => call, throwsA(isA<HttpException>()));
      verify(() => mockHttpClient.get(apiUrl));
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
}
