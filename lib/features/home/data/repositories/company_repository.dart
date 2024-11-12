import 'package:tractian_challenge/features/home/data/data_sources/company_data_source.dart';
import 'package:tractian_challenge/features/home/data/models/company_model.dart';
import 'package:tractian_challenge/features/home/domain/repositories/i_company_repository.dart';

class CompanyRepository implements ICompanyRepository {
  final ICompanyRemoteDataSource _dataSource;

  CompanyRepository({required ICompanyRemoteDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<List<Company>> getCompanies() {
    return _dataSource.getCompanies();
  }
}
