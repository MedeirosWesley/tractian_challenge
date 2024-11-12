import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:tractian_challenge/core/http_client/dio_http_client_service.dart';
import 'package:tractian_challenge/core/states/app_sate.dart';
import 'package:tractian_challenge/core/widgets/icons/logo.dart';
import 'package:tractian_challenge/features/home/data/data_sources/company_data_source.dart';
import 'package:tractian_challenge/features/home/data/repositories/company_repository.dart';
import 'package:tractian_challenge/features/home/domain/use_cases/company_use_case.dart';
import 'package:tractian_challenge/features/home/presentation/stores/company_store.dart';
import 'package:tractian_challenge/features/home/presentation/widgets/company_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = CompanyController(
    useCase: CompanyUseCase(
      repository: CompanyRepository(
        dataSource: CompanyRemoteDataSource(
          service: DioIHttpClient(),
        ),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller.getCompanies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: const LogoIcon(height: 17, width: 126),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Observer(builder: (_) {
          return switch (_controller.state) {
            IdleState() => const Center(
                child: CircularProgressIndicator(),
              ),
            LoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            ErrorState errorState =>
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.error_outline_rounded,
                  size: 55,
                ),
                Text(
                  'Ops! Algo deu errado',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Text(
                  errorState.message,
                  style: textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ]),
            LoadedState() => ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 40),
                itemCount: _controller.companies.length,
                itemBuilder: (_, index) {
                  final company = _controller.companies[index];
                  return CompanyWidget(
                      onTap: () => context.push(context.namedLocation(
                            'assets',
                            pathParameters: {
                              'companyId': _controller.companies[index].id
                            },
                          )),
                      companyName: company.name);
                },
              ),
            _ => const SizedBox(),
          };
        }),
      ),
    );
  }
}
