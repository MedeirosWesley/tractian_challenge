import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tractian_challenge/core/http_client/dio_http_client_service.dart';
import 'package:tractian_challenge/core/states/app_sate.dart';
import 'package:tractian_challenge/features/asset/data/data_sources/asset_remote_data_source.dart';
import 'package:tractian_challenge/features/asset/data/data_sources/location_remote_data_source.dart';
import 'package:tractian_challenge/features/asset/data/enums/sensor_type.dart';
import 'package:tractian_challenge/features/asset/data/repositories/asset_repository.dart';
import 'package:tractian_challenge/features/asset/data/repositories/location_repository.dart';
import 'package:tractian_challenge/features/asset/domain/use_cases/asset_use_case.dart';
import 'package:tractian_challenge/features/asset/domain/use_cases/location_use_case.dart';
import 'package:tractian_challenge/features/asset/presentation/stores/asset_store.dart';
import 'package:tractian_challenge/features/asset/presentation/widgets/custom_text_field.dart';
import 'package:tractian_challenge/features/asset/presentation/widgets/filter_buttom.dart';
import 'package:tractian_challenge/features/asset/presentation/widgets/tree_view_widget.dart';

class AssetPage extends StatefulWidget {
  final String companyId;
  const AssetPage({super.key, required this.companyId});

  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  late final AssetStore _controller;

  @override
  void initState() {
    super.initState();
    _controller = AssetStore(
        companyId: widget.companyId,
        locationUseCase: LocationUseCase(
            repository: LocationRepository(
                remoteDataSource:
                    LocationRemoteDataSource(service: DioIHttpClient()))),
        assetUseCase: AssetUseCase(
            repository: AssetRepository(
                remoteDataSource:
                    AssetRemoteDataSource(service: DioIHttpClient()))));
    _controller.getResources();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Assets', style: TextStyle(color: Colors.white)),
      ),
      body: Observer(builder: (_) {
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
          LoadedState() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          onChanged: (p0) => _controller.filterByText(p0),
                          hint: 'Buscar Ativo ou Local',
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: [
                            FilterButtom(
                                onSelected: (p0) =>
                                    _controller.setSelectedSensorType(
                                        p0 ? SensorType.energy : null),
                                label: 'Sensor de Energia',
                                icon: Icons.bolt_outlined),
                            FilterButtom(
                                onSelected: (p0) =>
                                    _controller.setCriticalStatus(p0),
                                label: 'Crítico',
                                icon: Icons.error_outline_rounded),
                          ],
                        ),
                      ],
                    )),
                const Divider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: TreeViewWidget(
                      nodes: _controller.filteredNodeTrees,
                      level: 0,
                    ),
                  ),
                ),
              ],
            ),
          _ => const SizedBox(),
        };
      }),
    );
  }
}
