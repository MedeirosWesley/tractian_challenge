import 'package:tractian_challenge/features/company/data/models/company_model.dart';
import 'package:tractian_challenge/features/company/domain/repositories/i_company_repository.dart';

abstract interface class ICompanyUseCase {}

class CompanyUseCase {
  final ICompanyRepository _repository;

  CompanyUseCase({required ICompanyRepository repository})
      : _repository = repository;

  Future<List<Company>> getCompany() async {
    return await _repository.getCompanies();
  }
}