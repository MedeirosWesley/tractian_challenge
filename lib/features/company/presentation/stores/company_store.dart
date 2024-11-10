import 'package:mobx/mobx.dart';
import 'package:tractian_challenge/core/states/app_sate.dart';
import 'package:tractian_challenge/features/company/data/models/company_model.dart';
import 'package:tractian_challenge/features/company/domain/use_cases/company_use_case.dart';

part 'company_store.g.dart';

class CompanyController = CompanyStore with _$CompanyController;

abstract class CompanyStore with Store {
  final CompanyUseCase _useCase;

  @observable
  AppState state = IdleState();

  @observable
  List<Company> companies = [];

  CompanyStore({required CompanyUseCase useCase}) : _useCase = useCase;

  @action
  Future<void> getCompanies() async {
    state = LoadingState();
    try {
      companies = await _useCase.getCompany();
      state = LoadedState();
    } catch (e) {
      state = ErrorState(message: e.toString());
    }
  }
}
