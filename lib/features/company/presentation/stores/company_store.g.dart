// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompanyController on CompanyStore, Store {
  late final _$stateAtom = Atom(name: 'CompanyStore.state', context: context);

  @override
  AppState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AppState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$companiesAtom =
      Atom(name: 'CompanyStore.companies', context: context);

  @override
  List<Company> get companies {
    _$companiesAtom.reportRead();
    return super.companies;
  }

  @override
  set companies(List<Company> value) {
    _$companiesAtom.reportWrite(value, super.companies, () {
      super.companies = value;
    });
  }

  late final _$getCompaniesAsyncAction =
      AsyncAction('CompanyStore.getCompanies', context: context);

  @override
  Future<void> getCompanies() {
    return _$getCompaniesAsyncAction.run(() => super.getCompanies());
  }

  @override
  String toString() {
    return '''
state: ${state},
companies: ${companies}
    ''';
  }
}
