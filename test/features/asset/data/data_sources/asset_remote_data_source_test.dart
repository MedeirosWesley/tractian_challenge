import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/core/constats/api_end_points.dart';
import 'package:tractian_challenge/core/http_client/i_http_client_service.dart';
import 'package:tractian_challenge/core/http_client/response_data.dart';
import 'package:tractian_challenge/features/asset/data/data_sources/asset_remote_data_source.dart';
import 'package:tractian_challenge/features/asset/data/models/node.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late AssetRemoteDataSource dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = AssetRemoteDataSource(service: mockHttpClient);
  });

  group('getAssetsByCompanyId', () {
    const companyId = '662fd0ee639069143a8fc387';
    final apiUrl = ApiEndpoints.assetsByCompanyId(companyId);
    final mockJson = [
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
      {
        "id": "656734448eb037001e474a62",
        "locationId": "656733b1664c41001e91d9ed",
        "name": "Fan H12D",
        "parentId": null,
        "sensorType": null,
        "status": null
      },
      {
        "gatewayId": "FRH546",
        "id": "656a07cdc50ec9001e84167b",
        "locationId": null,
        "name": "MOTOR RT COAL AF01",
        "parentId": "656a07c3f2d4a1001e2144c5",
        "sensorId": "FIJ309",
        "sensorType": "vibration",
        "status": "operating"
      },
      {
        "id": "656a07c3f2d4a1001e2144c5",
        "locationId": null,
        "name": "MOTOR TC01 COAL UNLOADING AF02",
        "parentId": "656a07bbf2d4a1001e2144c2",
        "sensorType": null,
        "status": null
      },
      {
        "gatewayId": "QBK282",
        "id": "6567340c1f4664001f29622e",
        "locationId": null,
        "name": "Motor H12D- Stage 1",
        "parentId": "656734968eb037001e474d5a",
        "sensorId": "CFX848",
        "sensorType": "vibration",
        "status": "alert"
      },
      {
        "gatewayId": "VHS387",
        "id": "6567340c664c41001e91dceb",
        "locationId": null,
        "name": "Motor H12D-Stage 2",
        "parentId": "656734968eb037001e474d5a",
        "sensorId": "GYB119",
        "sensorType": "vibration",
        "status": "alert"
      },
      {
        "gatewayId": "VZO694",
        "id": "656733921f4664001f295e9b",
        "locationId": null,
        "name": "Motor H12D-Stage 3",
        "parentId": "656734968eb037001e474d5a",
        "sensorId": "SIF016",
        "sensorType": "vibration",
        "status": "alert"
      },
      {
        "id": "656734968eb037001e474d5a",
        "locationId": "656733b1664c41001e91d9ed",
        "name": "Motors H12D",
        "parentId": null,
        "sensorType": null,
        "status": null
      }
    ];

    final response = ResponseData(url: apiUrl, statusCode: 200, data: mockJson);

    test('should return list of Nodes when the call to the API is successful',
        () async {
      when(() => mockHttpClient.get(apiUrl)).thenAnswer((_) async => response);

      final result = await dataSource.getAssetsByCompanyId(companyId);

      expect(result, isA<List<Node>>());
      verify(() => mockHttpClient.get(apiUrl));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test('should throw an exception when the call to the API fails', () async {
      when(() => mockHttpClient.get(apiUrl))
          .thenAnswer((_) async => throw const HttpException(''));

      final call = dataSource.getAssetsByCompanyId(companyId);

      expect(() => call, throwsException);
      verify(() => mockHttpClient.get(apiUrl));
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
}
