import 'package:tractian_challenge/features/company/data/models/company_model.dart';

abstract interface class ICompanyRepository {
  Future<List<Company>> getCompanies();
}
