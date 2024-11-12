import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/features/home/data/data_sources/company_data_source.dart';
import 'package:tractian_challenge/features/home/data/models/company_model.dart';
import 'package:tractian_challenge/features/home/data/repositories/company_repository.dart';

class MockCompanyRemoteDataSource extends Mock
    implements ICompanyRemoteDataSource {}

void main() {
  late CompanyRepository repository;
  late MockCompanyRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockCompanyRemoteDataSource();
    repository = CompanyRepository(dataSource: mockDataSource);
  });

  group('getCompanies', () {
    final tCompanyList = [
      Company(id: '662fd0ee639069143a8fc387', name: 'Jaguar'),
      Company(id: '662fd0fab3fd5656edb39af5', name: 'Tobias'),
      Company(id: '662fd100f990557384756e58', name: 'Apex'),
    ];

    test(
        'should return list of companies when the call to data source is successful',
        () async {
      when(() => mockDataSource.getCompanies())
          .thenAnswer((_) async => tCompanyList);

      final result = await repository.getCompanies();

      expect(result, tCompanyList);
      verify(() => mockDataSource.getCompanies());
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        'should throw an exception when the call to data source is unsuccessful',
        () async {
      when(() => mockDataSource.getCompanies())
          .thenAnswer((_) async => throw const HttpException(''));
      final call = repository.getCompanies;
      expect(() => call(), throwsException);
    });
  });
}
