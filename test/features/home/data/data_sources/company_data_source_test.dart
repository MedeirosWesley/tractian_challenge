import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/core/constats/api_end_points.dart';
import 'package:tractian_challenge/core/http_client/i_http_client_service.dart';
import 'package:tractian_challenge/core/http_client/response_data.dart';
import 'package:tractian_challenge/features/home/data/data_sources/company_data_source.dart';
import 'package:tractian_challenge/features/home/data/models/company_model.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late CompanyRemoteDataSource dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = CompanyRemoteDataSource(service: mockHttpClient);
  });

  group('getCompanies', () {
    final mockJson = [
      {"id": "662fd0ee639069143a8fc387", "name": "Jaguar"},
      {"id": "662fd0fab3fd5656edb39af5", "name": "Tobias"},
      {"id": "662fd100f990557384756e58", "name": "Apex"}
    ];
    const url = ApiEndpoints.companies;

    final response = ResponseData(data: mockJson, statusCode: 200, url: url);

    test(
        'should return list of companies when the call to remote data source is successful',
        () async {
      when(() => mockHttpClient.get(url)).thenAnswer((_) async => response);

      final result = await dataSource.getCompanies();

      expect(result, isA<List<Company>>());
      verify(() => mockHttpClient.get(url));
      verifyNoMoreInteractions(mockHttpClient);
    });

    test(
        'should throw an exception when the call to remote data source is unsuccessful',
        () async {
      when(() => mockHttpClient.get(ApiEndpoints.companies))
          .thenAnswer((_) async => throw const HttpException(''));

      final call = dataSource.getCompanies;

      expect(() => call(), throwsA(isA<Exception>()));
      verify(() => mockHttpClient.get(ApiEndpoints.companies));
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
}
